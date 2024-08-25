typedef unsigned long size_t;
typedef __builtin_va_list va_list;
#define bool _Bool
#define va_start(ap, param) __builtin_va_start(ap, param)
#define va_end(ap)          __builtin_va_end(ap)
#define va_arg(ap, type)    __builtin_va_arg(ap, type)

int printf(const char *pattern, ...);
int scanf(const char *pattern, ...);
int sprintf(char *dest, const char *pattern, ...);
int sscanf(const char *src, const char *pattern, ...);
size_t strlen(const char *str);
int strcmp(const char *s1, const char *s2);
void *memcpy(void *dest, const void *src, size_t n);
void *malloc(size_t n);

void print(char *str) {
    printf("%s", str);
}
void println(char *str) {
    printf("%s\n", str);
}
void printInt(int n) {
    printf("%d", n);
}
void printlnInt(int n) {
    printf("%d\n", n);
}

int getInt() {
    int n;
    scanf("%d", &n);
    return n;
}
char *getString() {
    char *buffer = malloc(256);
    scanf("%s", buffer);
    return buffer;
}

char *toString(int n) {
    char *buf = malloc(16);
    sprintf(buf, "%d", n);
    return buf;
}

char *string_copy(char *str) {
    int length = strlen(str);
    char *buffer = malloc(length + 1);
    memcpy(buffer, str, length);
    buffer[length] = '\0';
    return buffer;
}

int string_length(char *str) {
    return strlen(str);
}

char *string_substring(char *str, int left, int right) {
    int length = right - left;
    char *buffer = malloc(length + 1);
    memcpy(buffer, str + left, length);
    buffer[length] = '\0';
    return buffer;
}

int string_parseInt(char *str) {
    int n;
    sscanf(str, "%d", &n);
    return n;
}

int string_ord(char *str, int pos) {
    return (int)str[pos];
}

char *string_add(char *str1, char *str2) {
    int length1 = strlen(str1);
    int length2 = strlen(str2);
    int length = length1 + length2;
    char *buffer = malloc(length + 1);
    memcpy(buffer, str1, length1);
    memcpy(buffer + length1, str2, length2);
    buffer[length] = '\0';
    return buffer;
}

bool string_equal(char *str1, char *str2) {
    return strcmp(str1, str2) == 0;
}

bool string_notEqual(char *str1, char *str2) {
    return strcmp(str1, str2) != 0;
}

bool string_less(char *str1, char *str2) {
    return strcmp(str1, str2) < 0;
}

bool string_lessOrEqual(char *str1, char *str2) {
    return strcmp(str1, str2) <= 0;
}

bool string_greater(char *str1, char *str2) {
    return strcmp(str1, str2) > 0;
}

bool string_greaterOrEqual(char *str1, char *str2) {
    return strcmp(str1, str2) >= 0;
}

int array_size(void *arr) {
    return ((int*)arr)[-1];
}

// malloc函数分配的内存空间单位是字节
void *_malloc(int n){
    return malloc(n);
}

// int* a = new int [10];
// size = sizeof(int) = 4;
// length = 10;

void *__alloca_helper(int size, int length) {
  int *a = (int *)malloc(size * length + 4);
  a[0] = length;
  return a + 1;
}

// int* a = new int [10][11][12][][][][];
// size = sizeof(int) = 4;
// depth = 7;
// lengths = 10, 11, 12;
// remaining = 3;

void *__array_alloca_inside(int size, int depth, int *lengths, int remaining) {
  if (depth == 1) {
    return __alloca_helper(size, *lengths);
  }
  if (remaining == 1) {
    return __alloca_helper(sizeof(void *), *lengths);
  }
  void *array = __alloca_helper(sizeof(void *), *lengths);
  for (int i = 0; i < *lengths; i++) {
    ((void **)array)[i] = __array_alloca_inside(size, depth - 1, lengths + 1, remaining - 1);
  }
  return array;
}


// int* a = new int [10][11][12][][][][];
// size = sizeof(int) = 4;
// depth = 7;
// length = 3;
// ... contains 10, 11, 12

void *__array_alloca(int size, int depth, int length, ...) {
  va_list ap;
  int *a = (int *)malloc(sizeof(int) * length);
  va_start(ap, length);
  for (int i = 0; i < length; i++) {
    a[i] = va_arg(ap, int);
  }
  va_end(ap);
  return __array_alloca_inside(size, depth, a, length);
}

char * Int_toString(int num) {
  char *str;
  str = (char *)malloc(sizeof(char) * 10);
  sprintf(str, "%d", num);
  return str;
}

char * Bool_toString(bool flag) {
    if(flag) {
        return "true";
    } else {
        return "false";
    }
}