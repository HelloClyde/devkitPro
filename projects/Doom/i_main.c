// Emacs style mode select   -*- C++ -*- 
//-----------------------------------------------------------------------------
//
// $Id:$
//
// Copyright (C) 1993-1996 by id Software, Inc.
//
// This source is available for distribution and/or modification
// only under the terms of the DOOM Source Code License as
// published by id Software. All rights reserved.
//
// The source is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
// for more details.
//
// $Log:$
//
// DESCRIPTION:
//	Main program, simply calls D_DoomMain high level loop.
//
//-----------------------------------------------------------------------------

static const char
rcsid[] = "$Id: i_main.c,v 1.4 1997/02/03 22:45:10 b1 Exp $";

 
#include "doomdef.h"

#include "m_argv.h"
#include "d_main.h"


/* Define the module info section */
PSP_MODULE_INFO("Doom-PSP", 0, 1, 1);

/* Define the main thread's attribute value (optional) */
PSP_MAIN_THREAD_ATTR(THREAD_ATTR_USER | THREAD_ATTR_VFPU);
 
extern void _DisableFPUExceptions();
extern void sound_callback(void *buf, unsigned int reqn);


/* Exit callback */
int exit_callback(void)
{
	sceKernelExitGame();
	return 0;
}

/* Callback thread */
void CallbackThread(void *arg)
{
	int cbid;

	cbid = sceKernelCreateCallback("Exit Callback", (void *)exit_callback, NULL);
	sceKernelRegisterExitCallback(cbid);

	sceKernelSleepThreadCB();
}


/* Sets up the callback thread and returns its thread id */
int SetupCallbacks(void)
{
	int thid = 0;

	thid = sceKernelCreateThread("update_thread", (void *)CallbackThread, 0x11, 0xFA0, 0, 0);
	if(thid >= 0)
	{
		sceKernelStartThread(thid, 0, 0);
	}

	return thid;
}

 

int
main
( int		argc,
  char**	argv ) 
{ 
    myargc = argc; 
    myargv = argv; 



			
	pspAudioInit();
	pspAudioSetChannelCallback(0, (void *)&sound_callback);


	_DisableFPUExceptions();
	pspDebugScreenInit();

	sceCtrlSetSamplingCycle(0);
	sceCtrlSetSamplingMode(PSP_CTRL_MODE_ANALOG);

	SetupCallbacks();
 
    D_DoomMain (); 

    return 0;
} 
