//it is my first c program
//by kydkong
#include <pspkernel.h>
#include <pspdisplay.h>
#include <pspctrl.h>

PSP_MODULE_INFO("test ", 0, 1, 1); 

#define printf pspDebugScreenPrintf
#define readpad sceCtrlReadBufferPositive
#define screenclear pspDebugScreenClear

// Exit callback
int exit_callback(int arg1, int arg2, void *common)
{
      sceKernelExitGame();
      return 0;
}

// Callback thread
int CallbackThread(SceSize args, void *argp)
{
      int cbid;

      cbid = sceKernelCreateCallback("Exit Callback", exit_callback, NULL);
      sceKernelRegisterExitCallback(cbid);

      sceKernelSleepThreadCB();

      return 0;
}

// Sets up the callback thread and returns its thread id
int SetupCallbacks(void)
{
      int thid = 0;

      thid = sceKernelCreateThread("update_thread", CallbackThread, 0x11, 0xFA0, 0, 0);
      if(thid >= 0) 
      {
            sceKernelStartThread(thid, 0, 0);
      }

      return thid;
} 
	  
int main(void)
{ 
      pspDebugScreenInit();
      int s=0;
      int i=1;
      SceCtrlData pad;
	  printf("Press [X] To Start");
      while(1){
	      readpad(&pad,1);
		  if(pad.Buttons & PSP_CTRL_CROSS){
		      break;
		  }
      }
      while(i<= 100){
	      s=s+i;
		  i++;
	  }
	  screenclear();
	  printf("result:%i",s);
      SetupCallbacks(); 
	  sceKernelSleepThread();
      return 0;
}