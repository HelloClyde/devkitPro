/// Hello PSP - My First App for the PSP

#include <pspkernel.h>
#include <pspdebug.h> 

PSP_MODULE_INFO("Hello PSP", 0, 1, 1); 


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

int main()
{ 
	pspDebugScreenInit();
	SetupCallbacks(); 
	
	pspDebugScreenPrintf("Hello PSP"); 
	
	sceKernelSleepThread(); 
	return 0; 
} 
