#include <stdio.h>
#include <string.h>
#include <stdlib.h>

bool M3(char);
char Buffer[10000];

int main()
{
   fgets(Buffer,10000,stdin);
   while (!feof(stdin))
   {
      Buffer[strlen(Buffer)-1] = '\0';
      if (strcmp(Buffer,"quit") == 0)
      {
         exit(0);
      }
      bool result;
      result = M3('\0');
      for (char *tc = Buffer ; *tc ; tc++)
      {
         result = M3(*tc);
      }
      fputs(Buffer,stdout);
      if (result)
      {
         fputs(" - Good\n",stdout);
      }
      else
      {
         fputs(" - Bad\n",stdout);
      }
      fgets(Buffer,10000,stdin);
   }
}
