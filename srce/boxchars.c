#include <stdio.h>
#include <wchar.h>
#include <locale.h>

int main() {
    setlocale(LC_CTYPE, "");
    wchar_t start = 0x2500;
    wchar_t end   = 0x2570;
    int i;

    for (i=start;i<=end;i++)
      wprintf(L"%lc",i);
}
