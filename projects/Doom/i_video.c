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
//	DOOM graphics stuff for SDL library
//
//-----------------------------------------------------------------------------

static const char
rcsid[] = "$Id: i_x.c,v 1.6 1997/02/03 22:45:10 b1 Exp $";

#include <stdlib.h>

#include "m_swap.h"
#include "doomstat.h"
#include "i_system.h"
#include "v_video.h"
#include "m_argv.h"
#include "d_main.h"

#include "doomdef.h"


#define BUF_WIDTH (512)
#define SCR_WIDTH (480)
#define SCR_HEIGHT (272)
#define PIXEL_SIZE (4) /* change this if you change to another screenmode */
#define FRAME_SIZE (BUF_WIDTH * SCR_HEIGHT * PIXEL_SIZE)
#define ZBUF_SIZE (BUF_WIDTH SCR_HEIGHT * 2) /* zbuffer seems to be 16-bit? */

static unsigned int __attribute__((aligned(16))) list[262144];

// Fake mouse handling.
boolean		grabMouse;

// Blocky mode,
// replace each 320x200 pixel with multiply*multiply pixels.
// According to Dave Taylor, it still is a bonehead thing
// to use ....
static int	multiply=1;


unsigned int __attribute__((aligned(16))) colors[256];
 
/* fuck pspupdates.com */

static SceCtrlData ctl;
#define REPEAT_TIME 0x40000
static unsigned long control_bef_ctl  = 0;
static unsigned long control_bef_tick = 0;

weapontype_t num;
static player_t*	plyrweap; 

struct Vertex
{
	float u,v;
	float x,y,z;
};


void I_ShutdownGraphics(void)
{
   
}



//
// I_StartFrame
//
void I_StartFrame (void)
{
     

}


unsigned long Read_Key(void) {
	

	sceCtrlReadBufferPositive(&ctl, 1); 

	if (ctl.Buttons == control_bef_ctl) {
		return 0;
	}
	control_bef_ctl  = ctl.Buttons;
	return control_bef_ctl;
}


/* This processes SDL events */
void I_GetEvent()
{
    static  event_t  event;
    static  event_t  kbevent;
 

	unsigned long key;

	event.type = ev_joystick;
    event.data1 = 0;
	event.data2 = 0;
	event.data3 = 0;

	key = Read_Key();
 
 	if (ctl.Ly >= 0xD0) event.data3 = 1;  // DOWN
 	if (ctl.Ly <= 0x10) event.data3 = -1;    // UP
 	if (ctl.Lx <= 0x10) event.data2 = -1;  // LEFT
 	if (ctl.Lx >= 0xD0) event.data2 = 1;  // RIGHT


	D_PostEvent(&event);


	if (key & PSP_CTRL_START)
	{
		kbevent.type = ev_keydown;
		kbevent.data1 = KEY_ENTER;
		D_PostEvent(&kbevent);
	}
	else  
	{
		kbevent.type = ev_keyup;
		kbevent.data1 = KEY_ENTER;
		D_PostEvent(&kbevent);
	}  

 	if (key & PSP_CTRL_SELECT)
	{
		kbevent.type = ev_keydown;
		kbevent.data1 = KEY_ESCAPE;
		D_PostEvent(&kbevent);
	}
	else  
	{
		kbevent.type = ev_keyup;
		kbevent.data1 = KEY_ESCAPE;
		D_PostEvent(&kbevent);
	}  

	if (key & PSP_CTRL_CROSS)
	{
		kbevent.type = ev_keydown;
		kbevent.data1 = ' ';
		D_PostEvent(&kbevent);
	}
	else  
	{
		kbevent.type = ev_keyup;
		kbevent.data1 = ' ';
		D_PostEvent(&kbevent);
	}  

	if (gamestate == GS_LEVEL)
	{

		plyrweap = &players[consoleplayer];
 
		num = plyrweap->readyweapon;

		if (key & PSP_CTRL_UP)
		{

		 
			

			while (1)
			{

			
					num++;

				if (num > wp_supershotgun)
					num = wp_fist;


				if (plyrweap->weaponowned[num])
				{
					plyrweap->pendingweapon = num;
					break;
				}

				
			}

		 
			kbevent.type = ev_keydown;
			kbevent.data1 = KEY_1 + num;
			D_PostEvent(&kbevent);
		}
		else  
		{
			kbevent.type = ev_keyup;
			kbevent.data1 = KEY_1 + num;
			D_PostEvent(&kbevent);
		}  



		if (key & PSP_CTRL_DOWN)
		{

	 
			while (1)
			{

				num--;

				if (num == -1)
					num = wp_supershotgun;

 

				if (plyrweap->weaponowned[num])
				{
					plyrweap->pendingweapon = num;
					break;
				}

				
			}

 
		
			kbevent.type = ev_keydown;
			kbevent.data1 = KEY_1 + num;
			D_PostEvent(&kbevent);
		}
 

	}

	if (key & PSP_CTRL_TRIANGLE)
	{
		kbevent.type = ev_keydown;
		kbevent.data1 = KEY_TAB;
		D_PostEvent(&kbevent);
	}
	else  
	{
		kbevent.type = ev_keyup;
		kbevent.data1 = KEY_TAB;
		D_PostEvent(&kbevent);
	}  


	if (ctl.Buttons & PSP_CTRL_SQUARE)
	{
		kbevent.type = ev_keydown;
		kbevent.data1 = ',';
		D_PostEvent(&kbevent);
	}
	else  
	{
		kbevent.type = ev_keyup;
		kbevent.data1 = ',';
		D_PostEvent(&kbevent);
	}  

	if (ctl.Buttons & PSP_CTRL_CIRCLE)
	{
		kbevent.type = ev_keydown;
		kbevent.data1 = '.';
		D_PostEvent(&kbevent);
	}
	else  
	{
		kbevent.type = ev_keyup;
		kbevent.data1 = '.';
		D_PostEvent(&kbevent);
	}  
 
	 if(ctl.Buttons & PSP_CTRL_LTRIGGER){
		kbevent.type = ev_keydown;
		kbevent.data1 = KEY_RSHIFT;
		D_PostEvent(&kbevent);
	}
	else  
	{
		kbevent.type = ev_keyup;
		kbevent.data1 = KEY_RSHIFT;
		D_PostEvent(&kbevent);
	}
 
 

 	if(ctl.Buttons & PSP_CTRL_RTRIGGER){
		kbevent.type = ev_keydown;
		kbevent.data1 = KEY_RCTRL;
		D_PostEvent(&kbevent);
	}
	else  
	{
		kbevent.type = ev_keyup;
		kbevent.data1 = KEY_RCTRL;
		D_PostEvent(&kbevent);
	}

}

//
// I_StartTic
//
void I_StartTic (void)
{
	I_GetEvent( ); 
}


//
// I_UpdateNoBlit
//
void I_UpdateNoBlit (void)
{
    // what is this?
}

//
// I_FinishUpdate
//
void I_FinishUpdate (void)
{

	

	unsigned char *ilineptr;

	ilineptr = (unsigned char *) screens[0];
 
	sceKernelDcacheWritebackAll();
	sceGuStart(0,list);
	sceGuClearColor(0xff000000);
	sceGuClearDepth(0);
	sceGuClear(GE_CLEAR_COLOR|GE_CLEAR_DEPTH);


	sceGuClear(GE_CLEAR_COLOR|GE_CLEAR_DEPTH);
 
	sceGuClutMode(GE_TPSM_8888,0,0xff,0); // 32-bit palette
	sceGuClutLoad((32),colors); // upload 32*8 entries (256)

	sceGuTexMode(GE_TPSM_T8,0,0,0);  
	sceGuTexImage(0,512,256,320, ilineptr);
	sceGuTexFunc(GE_TFX_REPLACE,0);
	sceGuTexFilter(GE_FILTER_LINEAR,GE_FILTER_LINEAR);
	sceGuTexScale(1,1);
	sceGuTexOffset(0,0);
	sceGuAmbientColor(0xffffffff);

	// render sprite

	sceGuColor(0xffffffff);
	struct Vertex* vertices = (struct Vertex*)sceGuGetMemory(2 * sizeof(struct Vertex));
	vertices[0].u = 0; vertices[0].v = 0;
	vertices[0].x = 0; vertices[0].y = 0; vertices[0].z = 0;
	vertices[1].u = 320; vertices[1].v = 200;
	vertices[1].x = 480; vertices[1].y = 272; vertices[1].z = 0;
	sceGuDrawArray(GU_PRIM_SPRITES,GE_SETREG_VTYPE(GE_TT_32BITF,0,0,GE_MT_32BITF,0,0,0,0,GE_BM_2D),2,0,vertices);

	// wait for next frame

	sceGuFinish();
	sceGuSync(0,0);

 	
	sceGuSwapBuffers();

 

 
}


//
// I_ReadScreen
//
void I_ReadScreen (byte* scr)
{
    memcpy (scr, screens[0], SCREENWIDTH*SCREENHEIGHT);
}


//
// I_SetPalette
//
void I_SetPalette (byte* palette)
{
    int i;

	unsigned int* colors256 = (unsigned int*)(((unsigned int)colors)|0x40000000);
	
	for (i = 0; i < 256; ++i)
	{
		unsigned int r = (gammatable[usegamma][*palette++])&0xff;
		unsigned int g = (gammatable[usegamma][*palette++])&0xff;
		unsigned int b = (gammatable[usegamma][*palette++])&0xff;

		*(colors256++) = (0 & 0xFF << 24)|
			             (b << 16)|
					     (g << 8) |
						 (r);
	}


}


void I_InitGraphics(void)
{
	static int	firsttime=1;
    long video_w, video_h, w, h;
    long video_bpp;
    
    if (!firsttime)
	return;
    firsttime = 0;
 

	multiply = 1;

    if (M_CheckParm("-2"))
	multiply = 2;

    if (M_CheckParm("-3"))
	multiply = 3;

    // check if the user wants to grab the mouse (quite unnice)
    grabMouse = !!M_CheckParm("-grabmouse");

    video_w = w = 320;
    video_h = h = 200;
    video_bpp = 8;
 
    /* Set up the screen displays */
    w = SCREENWIDTH * multiply;
    h = SCREENHEIGHT * multiply;
    
	screens[0] = (unsigned char *) malloc(SCREENWIDTH * SCREENHEIGHT);

	sceKernelDcacheWritebackAll();

	// setup GU

	sceGuInit();
	sceGuStart(0,list);

	sceGuDrawBuffer(GE_PSM_8888,(void*)0,BUF_WIDTH);
	sceGuDispBuffer(SCR_WIDTH,SCR_HEIGHT,(void*)FRAME_SIZE,BUF_WIDTH);
	sceGuDepthBuffer((void*)(FRAME_SIZE*2),BUF_WIDTH);
	sceGuOffset(2048 - (SCR_WIDTH/2),2048 - (SCR_HEIGHT/2));
	sceGuViewport(2048,2048,SCR_WIDTH,SCR_HEIGHT);
	sceGuDepthRange(0xc350,0x2710);
	sceGuScissor(0,0,SCR_WIDTH,SCR_HEIGHT);
	sceGuEnable(GU_STATE_SCISSOR);
	sceGuFrontFace(GE_FACE_CW);
	sceGuEnable(GU_STATE_TEXTURE);
	sceGuClear(GE_CLEAR_COLOR|GE_CLEAR_DEPTH);
	sceGuFinish();
	sceGuSync(0,0);

	sceDisplayWaitVblankStart();
	pspDebugScreenClear();

	sceGuDisplay(GU_DISPLAY_ON);
 
}
