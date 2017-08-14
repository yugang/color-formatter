#include <assert.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <unistd.h>
#include <getopt.h>

#define INPUT_FORMAT_NUM 3
#define OUTPUT_FORMAT_NUM 3

struct output_input_formats {
  char output_format[64];
  char input_format_list[INPUT_FORMAT_NUM][64];
};

struct output_input_formats output_input_mapping[OUTPUT_FORMAT_NUM] = {
    {"yv12", "yuv411"},
    {"y8", {"yuv444", "yuv411", "yuv420"}},
    {"y16", {"yuv444", "yuv411", "yuv420"}}};

char input_raw[1024];
char output_raw[1024];
char input_format[64];
char output_format[64];
unsigned int width = 0;
unsigned int height = 0;

static void print_help(void) {
  printf("usage: colorformatter [--help] [--input] [--input-format]"
         "[--width] [--height] [--output] [--output-format]\n");
}

static void parse_args(int argc, char *argv[]) {
  static const struct option longopts[] = {
      {"help", no_argument, NULL, '0'},
      {"input", required_argument, NULL, '1'},
      {"input-format", required_argument, NULL, '2'},
      {"output", required_argument, NULL, '3'},
      {"output-format", required_argument, NULL, '4'},
      {"width", required_argument, NULL, '5'},
      {"height", required_argument, NULL, '6'},
      {0},
  };

  char *endptr;
  int opt;
  int longindex = 0;

  opterr = 0;
  memset(input_raw, 0, sizeof(input_raw));
  memset(input_format, 0, sizeof(input_format));
  memset(output_raw, 0, sizeof(output_raw));
  memset(output_format, 0, sizeof(output_format));

  while ((opt = getopt_long(argc, argv, "+:h0:1:2:3:4:5:6:", longopts,
                            &longindex)) != -1) {
    switch (opt) {
    case '0':
      print_help();
      exit(0);
      break;
    case '1':
      if (strlen(optarg) >= 1024) {
        printf("too long input path, litmited less than 1024!\n");
        exit(0);
      }
      strcpy(input_raw, optarg);
      break;
    case '2':
      if (strlen(optarg) >= 64) {
        printf("too long input format, litmited less than 256!\n");
        exit(0);
      }
      strcpy(input_format, optarg);
      break;
    case '3':
      if (strlen(optarg) >= 1024) {
        printf("too long output path, litmited less than 1024!\n");
        exit(0);
      }
      strcpy(output_raw, optarg);
      break;
    case '4':
      if (strlen(optarg) >= 64) {
        printf("too long output format, litmited less than 256!\n");
        exit(0);
      }
      strcpy(output_format, optarg);
      break;
    case '5':
      errno = 0;
      width = strtoul(optarg, &endptr, 0);
      if (errno || *endptr != '\0') {
        fprintf(stderr, "usage error: invalid value for <width>\n");
        exit(EXIT_FAILURE);
      }
      break;
    case '6':
      errno = 0;
      height = strtoul(optarg, &endptr, 0);
      if (errno || *endptr != '\0') {
        fprintf(stderr, "usage error: invalid value for <height>\n");
        exit(EXIT_FAILURE);
      }
      break;
    default:
      assert(opt == '?');
      fprintf(stderr, "usage error: unknown option '%s'\n", argv[optind - 1]);
      exit(EXIT_FAILURE);
      break;
    }
  }

  if (optind < argc) {
    fprintf(stderr, "usage error: trailing args\n");
    exit(EXIT_FAILURE);
  }
}

int main(int argc, char *argv[]) {
  parse_args(argc, argv);
  bool valid_input_output_format = false;
  for (int i_output = 0; i_output < OUTPUT_FORMAT_NUM; i_output++) {
    if (!strcmp(output_input_mapping[i_output].output_format, output_format)) {
      for (int i_input = 0; i_input < INPUT_FORMAT_NUM; i_input++) {
        if (!strcmp(output_input_mapping[i_output].input_format_list[i_input],
                    input_format)) {
          valid_input_output_format = true;
        }
      }
    };
  };

  if (!valid_input_output_format) {
    printf(
        "Invalid formats mapping of between input_format and output_format\n");
    exit(EXIT_FAILURE);
  }

  printf("Image Width: \t%d\nImage Height: \t%d\nInput Format:\t%s\nOutput "
         "Format:\t%s\n",
         width, height, input_format, output_format);

  exit(0);
}
