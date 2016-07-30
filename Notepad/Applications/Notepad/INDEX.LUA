--[[
///////////////////////////////////////////////////////////////////////////////
 Notepad

 Copyright(c) 2006, ema & kris.
///////////////////////////////////////////////////////////////////////////////
]]--


_j = {
  ua = true,
  timer = Timer.new(),
  SE = 1,
  tk = 0,
  pzu = 0,
  pzd = 0,
  pzl = 0,
  pzr = 0,
  pyu = 0,
  pyd = 0,
  pyl = 0,
  pyr = 0,
  PL  = 0,
  PR  = 0,
  pka = 0,
  pxa = 0
}

function _j:kd(KP)
  local c = self.tk - KP
  return KP > 0 and (c == 0 or c > 350)
end

function _j:dDREZ(KP)
  if KP == 0 then return 0 end
  local c = self.tk - KP
  if c == 0  then return 1 end
  if c > 350 then return self.SE end
  return 0
end

function _j:dDH_REZ()
  local H = _j:dDREZ(self.pzr) - _j:dDREZ(self.pzl)
  return H + math.ceil(self.wPX / 20 - 0.5)
end

function _j:dDV_REZ()
  local V = _j:dDREZ(self.pzd) - _j:dDREZ(self.pzu)
  return V + math.ceil(self.wPY / 20 - 0.5)
end

function _j:dDL_H()
  if self.tdLR then return  1 end
  if self.tdLL then return -1 end
  return 0
end

function _j:dDL_V()
  if self.tdLD then return  1 end
  if self.tdLU then return -1 end
  return 0
end

function _j:dDR_H()
  if self.adRR then return  1 end
  if self.adRL then return -1 end
  return 0
end

function _j:dDR_V()
  if self.adRD then return  1 end
  if self.adRU then return -1 end
  return 0
end

function _j:G_()
  local pp = Controls.read()
  local _QL, _QR, _QX = false, false, false
  
  local function jsH(m_wP, z_)
    if m_wP >= z_ then
      return m_wP - z_
    elseif m_wP >= -z_ then
      return 0
    else
      return m_wP + z_
    end
  end

  if self.ua then
    self.wPX = jsH(pp:analogX(), 32)
    self.wPY = jsH(pp:analogY(), 32)
  else
    self.wPX = 0
    self.wPY = 0
  end
  self.LU = pp:up(); self.LD = pp:down(); self.LL = pp:left(); self.LR = pp:right(); self.RU = pp:triangle(); self.RD = pp:cross(); self.RL = pp:square(); self.RR = pp:circle(); self.L  = pp:l(); self.R  = pp:r(); self.ST = pp:start(); self.SL = pp:select()
  self.tk = self.timer:start()
  if self.LU then  _QL = true  self.f_LU = false  self.tdLU = self.pzu == 0 if self.tdLU then self.pzu = self.tk end
  else  self.f_LU = self.pzu > 0  self.tdLU = false  self.pzu = 0
  end
  if self.LD then  _QL = true   self.f_LD = false  self.tdLD = self.pzd == 0 if self.tdLD then self.pzd = self.tk end
  else self.f_LD = self.pzd > 0  self.tdLD = false  self.pzd = 0  end
  if self.LL then   _QL = true  self.f_LL = false  self.tdLL = self.pzl == 0 if self.tdLL then self.pzl = self.tk end
  else   self.f_LL = self.pzl > 0   self.tdLL = false  self.pzl = 0
  end
  if self.LR then  _QL = true   self.f_LR = false   self.tdLR = self.pzr == 0 if self.tdLR then self.pzr = self.tk end
  else  self.f_LR = self.pzr > 0 self.tdLR = false self.pzr = 0 end
  if self.RU then _QR = true self.f_RU = false self.adRU = self.pyu == 0 if self.adRU then self.pyu = self.tk end
  else self.f_RU = self.pyu > 0 self.adRU = false self.pyu = 0 end
  if self.RD then _QR = true self.f_RD = false self.adRD = self.pyd == 0 if self.adRD then self.pyd = self.tk end
  else self.f_RD = self.pyd > 0 self.adRD = false self.pyd = 0 end
  if self.RL then  _QR = true self.f_RL = false self.adRL = self.pyl == 0 if self.adRL then self.pyl = self.tk end
  else self.f_RL = self.pyl > 0 self.adRL = false self.pyl = 0 end
  if self.RR then _QR = true self.f_RR = false self.adRR = self.pyr == 0 if self.adRR then self.pyr = self.tk end
  else self.f_RR = self.pyr > 0 self.adRR = false self.pyr = 0 end
  if self.L then _QX = true self.f_L = false self.tdL = self.PL == 0 if self.tdL then self.PL = self.tk end
  else self.f_L = self.PL > 0 self.tdL = false  self.PL = 0 end
  if self.R then  _QX = true  self.f_R = false  self.adR = self.PR == 0  if self.adR then self.PR = self.tk end
  else  self.f_R = self.PR > 0  self.adR = false  self.PR = 0
  end  if self.ST then   _QX = true   self.f_ST = false  self.tST = self.pka == 0  if self.tST then self.pka = self.tk end
  else   self.f_ST = self.pka > 0   self.tST = false   self.pka = 0 end  if self.SL then   _QX = true   self.f_SL = false
    self.tSL = self.pxa == 0   if self.tSL then self.pxa = self.tk end  else    self.f_SL = self.pxa > 0
    self.tSL = false   self.pxa = 0  end  self._APL  = _QL  self._APR  = _QR  self._APX  = _QX  self._APLR = _QL or _QR
  self._AP   = _QL or _QR or _QX  if not self._AP then   self.timer:reset(1)  end  return self._AP
end
_bw = Color.new(255,255,255)
_hb = Color.new(  0,  0,  0)
_hR   = Color.new(255,  0,  0)
_lg = Color.new(  0,255,  0)
_lb  = Color.new(  0,  0,255)

function _HzF(_hO_, x, y, w, h, Color)
  _hO_:drawLine(x, y, x + w, y, Color)
  _hO_:drawLine(x, y, x, y + h, Color)
  _hO_:drawLine(x + w, y, x + w, y + h, Color)
  _hO_:drawLine(x + w, y + h, x, y + h, Color)
end

function _XX_(_z_, _zM, _ZDx)
    return math.min(math.max(_z_, _zM), _ZDx)
end


_PzT_ = {
  ezTx = Image.load("FontData/ASC.png"),
  YySdT_ = {},
  _CZ_P_T = {[1] = Image.load("FontData/GB_1.png"),[2] = Image.load("FontData/GB_2.png"),[3] = Image.load("FontData/GB_3.png"),[4] = Image.load("FontData/GB_4.png"),[5] = Image.load("FontData/GB_5.png"),[6] = Image.load("FontData/GB_6.png"),[7] = Image.load("FontData/GB_7.png"),[8] = Image.load("FontData/GB_8.png") }}
function _PzT_:J_ZY_(y_dB_)
  if not y_dB_ then return self.ezTx end
  if not _PzT_.YySdT_[y_dB_] then
    local width = self.ezTx:width()
    local height = self.ezTx:height()
    local TX_EI_ = Image.createEmpty(width, height)
    TX_EI_:blit(0, 0, self.ezTx)
    for wPY = 0, 35 do
      for wPX = 0, width - 1 do
        local _D_S_ = TX_EI_:pixel(wPX, wPY):colors()
        if _D_S_.a ~= 0 then
          TX_EI_:pixel(wPX, wPY, y_dB_)
        end
      end
    end
    self.YySdT_[y_dB_] = TX_EI_
  end
  return _PzT_.YySdT_[y_dB_]
end

function _PzT_:xPzP_(x, y, _Z_Ct_F, _hO_, y_dB_)
  if not _Z_Ct_F then return nil end
  local _D_Q_W, bylzc = 1, string.len(_Z_Ct_F)
  local Font = self:J_ZY_(y_dB_)
  _hO_ = _hO_ or screen
  while _D_Q_W <= bylzc do
    local _CJND_ = string.byte(_Z_Ct_F, _D_Q_W)
    _D_Q_W = _D_Q_W + 1
    if _CJND_ < 128 and _CJND_ > 30 then
      _hO_:blit(x, y, Font, math.mod(_CJND_, 32) * 6, math.floor(_CJND_ / 32 - 1) * 12, 6, 12)
      x = x + 6
    else
      local _CJND__2nd = string.byte(_Z_Ct_F, _D_Q_W)
      _D_Q_W = _D_Q_W + 1
      if not _CJND__2nd then break end
      local Zw_SI = _CJND_ - 160
      local Hz_LO = _CJND__2nd - 161
      if Zw_SI > 12 then
        Hz_LO = 96 * math.mod(Zw_SI - 1, 12) + Hz_LO 
        Zw_SI = math.floor((Zw_SI - 1) / 12) + 1
      else
        Hz_LO = 96 * Zw_SI - (96 - Hz_LO)
        Zw_SI = 1
      end
      if Zw_SI <= 8 then
        _hO_:blit(x, y, _PzT_._CZ_P_T[Zw_SI], math.mod(Hz_LO, 32) * 12, math.floor(Hz_LO / 32) * 12 , 12, 12)
      end
      x = x + 12
    end
  end
  return x, y
end

LmGdG_ = {}
_hb = Color.new(0, 0, 0)
D_Hsa  = Color.new(160,160,160)
__hR  = Color.new(255, 65, 65)
_PzT_:J_ZY_(_hb)
_PzT_:J_ZY_(D_Hsa)
_PzT_:J_ZY_(__hR)
function LmGdG_:_in_oN(x, y, _Z_Ct_F, _XX__Width, _hO_, xtDyS_)
  _XX__Width = _XX__Width or 480
  xtDyS_ = xtDyS_ or _hb
  local _XX__Left = x
  local ezTx = _PzT_:J_ZY_(y_dB_)
  local _D_Q_W, bylzc = 1, string.len(_Z_Ct_F)
  _hO_ = _hO_ or screen
  while _D_Q_W <= bylzc do
    local _CJND_ = string.byte(_Z_Ct_F, _D_Q_W)
    _D_Q_W = _D_Q_W + 1
    if  _CJND_ < 32 then
      if _CJND_ == 10 then y = y + 12 ; x = _XX__Left end
    else
      if x > _XX__Width then y = y + 12 ; x = _XX__Left end
      _hO_:blit(x, y, _PzT_.YySdT_[xtDyS_], math.mod(_CJND_, 32) * 6, math.floor(_CJND_ / 32 - 1) * 12, 6, 12)
      x = x + 6
    end
  end
  return x, y
end
 
VP_xin_ = {
  n_DAp_ = "IME.txt",
  VP_xin_DATable = {},
  VP_xin_DACache = {},
  Phrase = false,
  InputBox = Image.load("Images/InputBox.png"),
  Buttons  = Image.load("Images/Buttons.png"),
  Keyboard = {
              [false] = Image.load("Images/Keyboard.png"),
              [true]  = Image.load("Images/CapsLock.png") },
  Palette = {
    [false] = {
                 [0]="1234567890",
                 [1]="qwertyuiop",
                 [2]="zasdfghjkl",
                 [3]="xc\bvbnm .;",
                 [4]="-'=()\\/,[]" },
    [true]  = {
                 [0]="!@#$%^&*~`",
                 [1]="QWERTYUIOP",
                 [2]="ZASDFGHJKL",
                 [3]="XC\tVBNM\n.:",
                 [4]="_\"+<>|?,{}" } },
}

function VP_xin_.new()
  local coty = setmetatable( {
    zkYm_C = false,
    zkYm_yj = true,
    hdd = false,
    VP_xin_RR = "",
    PYListc = 1,
    VP_xin_DA__u_eting = false,
    ouh_ = false,
    Shift = false,
    ing_ghi = false,
    x = 0,
    y = 0,
    bylz = nil },
    { __index = VP_xin_ } )
  return coty
end
function VP_xin_:ZCHd()
  self.ing_ghi = false
  self.x = 0
  self.y = 0
  self.bylz = nil
end
function VP_xin_:Ma_Ha_j(_hO_, x, y)
  if _hO_ then
    _hO_:blit(x, y, self.Keyboard[self.Shift])
    VP_xin_DAX, VP_xin_DAY = x, y
    if self.bylz then
      _HzF(_hO_, x + self.x * 13 + 2, y + self.y * 13 + 2, 11, 11, _hR)
    end
  end
end



function VP_xin_:VP_xin_DAZCHd()
  for Data in io.lines(self.n_DAp_) do
    for PYin, HZ in string.gfind(Data, "(%S+)%s(%S+)") do
      self.VP_xin_DATable[PYin] = HZ
    end
  end
end



function VP_xin_:SEa_L(_Z_Ct_F)
  local List = {}
  if _Z_Ct_F then
    if self.VP_xin_DATable[_Z_Ct_F] then
      self.VP_xin_DACache = self.VP_xin_DATable[_Z_Ct_F]
      local Next = string.find(self.VP_xin_DACache, "/")
      c = 1
      while true do 
        if Next == nil then break end
        List[c] = string.sub(self.VP_xin_DACache, 1, Next - 1)
        self.VP_xin_DACache = string.sub(self.VP_xin_DACache, Next + 1)
        c = c + 1
        Next = string.find(self.VP_xin_DACache, "/")
      end
      List[c] = self.VP_xin_DACache
      return List
    else
      return nil
    end
  end
end  



function VP_xin_:Input()
  local Result = nil

  if _j.tSL and not _j.L then
    self.zkYm_C = not(self.zkYm_C)
  end

  self.Shift = _j.L
  if _j.L and _j.adR then
    self:ZCHd()
    Result = "\n"
  end

  local L_H = _j:dDL_H()
  local L_V = _j:dDL_V()
  local R_H = _j:dDR_H()
  local R_V = _j:dDR_V()
  local Right_Keyed = (R_V ~= 0) or (R_H ~= 0)

  if _j._APLR then
    if not self.ing_ghi then
      self.ing_ghi = true
      if Right_Keyed then
        self.x = 7 + R_H
        self.y = 2 + R_V
      else
        self.x = 2 + L_H
        self.y = 2 + L_V
      end
    else
      self.x = _XX_(self.x + R_H + L_H, 0, 9)
      self.y = _XX_(self.y + R_V + L_V, 0, 4)
    end
    self.bylz = string.sub(self.Palette[self.Shift][self.y], self.x + 1, self.x + 1)
  else
    if self.ing_ghi then
      Result = self.bylz
      self.bylz = nil
      self.ing_ghi = false
    end
  end
  if self.zkYm_C then
    if _j.ST then self.VP_xin_RR = "" end
    if VP_xin_DAList then
      self.zkYm_yj = false
    else
      _HzF(screen, VP_xin_DAX + 1, VP_xin_DAY - 15, 133, 14, Color.new(172,168,153))
      _HzF(screen, VP_xin_DAX, VP_xin_DAY - 16, 133, 14, Color.new(220,226,240))
      screen:drawLine(VP_xin_DAX + 2, VP_xin_DAY - 3, VP_xin_DAX + 132, VP_xin_DAY - 3, _bw)
      screen:drawLine(VP_xin_DAX + 132, VP_xin_DAY - 14, VP_xin_DAX + 132, VP_xin_DAY - 3, _bw)
      screen:fillRect(VP_xin_DAX + 2, VP_xin_DAY - 14, 130, 11, Color.new(238,240,248))
      _PzT_:xPzP_(VP_xin_DAX + 3, VP_xin_DAY - 15, self.VP_xin_RR)
    end    
    local bylz_length = string.len(self.VP_xin_RR)
    if Result == " " then
      if bylz_length > 0 then
        VP_xin_DAList = self:SEa_L(self.VP_xin_RR)
        self.VP_xin_RR = ""
        Result = nil
      else return Result
      end
    end
    if Result == "\b" and bylz_length > 0 then
      if bylz_length == 1 then self.VP_xin_RR = ""
      else self.VP_xin_RR = string.sub(self.VP_xin_RR, 1, bylz_length - 1) end
    elseif Result == "\b" and bylz_length == 0 then
      return Result
    elseif Result == "\t" then
      VP_xin_DAList = self:SEa_L("symbol")
      self.VP_xin_RR = ""
      Result = nil
    elseif Result == "\n" then
      if bylz_length == 0 then
        return Result
      else
        Result = nil
      end
    elseif Result then
      local bylz__CJND_ = string.byte(Result)
      if bylz__CJND_ > 96 and bylz__CJND_ < 123 then
        if bylz_length < 12 then
          self.VP_xin_RR = self.VP_xin_RR .. Result
        end
      else
        return Result
      end
    end
  else
    return Result
  end
end

function VP_xin_:G_()
  if self.zkYm_yj then
    return self:Input()
  else
    self.hdd = true
    screen:blit(VP_xin_DAX, VP_xin_DAY - 130, self.InputBox)
    local Listp = table.getn(VP_xin_DAList)
    if Listp <= 8 then
      for c = 1, Listp do
        screen:blit(VP_xin_DAX + 4, VP_xin_DAY - 140 + (15 * c), self.Buttons, 1 + ( 18 * (c - 1)), 1, 16, 16)
        _PzT_:xPzP_(VP_xin_DAX + 25, VP_xin_DAY - 138 + (15 * c), VP_xin_DAList[c])
      end
    else
      local hdd = math.floor(Listp / 8)
      local Remain = math.mod(Listp, 8)
      if _j.tdL then self.PYListc = self.PYListc - 1 end
      if _j.adR then self.PYListc = self.PYListc + 1 end
      if self.PYListc < 1 then self.PYListc = 1 end
      if self.PYListc > hdd then
        if Remain == 0 then self.PYListc = hdd
        else self.PYListc = hdd + 1
        end
      end
     if self.PYListc == hdd + 1 then
        for c = 1, Remain do
          screen:blit(VP_xin_DAX + 4, VP_xin_DAY - 140 + (15 * c), self.Buttons, 1 + ( 18 * (c - 1)), 1, 16, 16)
          _PzT_:xPzP_(VP_xin_DAX + 25, VP_xin_DAY - 138 + (15 * c), VP_xin_DAList[c + (8 * (self.PYListc - 1))])        
        end
      else        
        for c = 1, 8 do
          screen:blit(VP_xin_DAX + 4, VP_xin_DAY - 140 + (15 * c), self.Buttons, 1 + ( 18 * (c - 1)), 1, 16, 16)
          _PzT_:xPzP_(VP_xin_DAX + 25, VP_xin_DAY - 138 + (15 * c), VP_xin_DAList[c + (8 * (self.PYListc - 1))])        
        end
      end
    end
    local _djgd_ = self:xzl__()
    if _djgd_ then
      self.VP_xin_DAing_ghi = true
      if _djgd_ == true then self.Phrase = false
      else
        local _W_S = VP_xin_DAList[(8 * (self.PYListc - 1)) + _djgd_]
        if self.VP_xin_DATable[_W_S] then
          VP_xin_DAList = self:SEa_L(_W_S)
          self.VP_xin_DAing_ghi = false
          self.Phrase = true
          return _W_S
        else
          if self.Phrase and _W_S then
            _W_S = string.sub(_W_S, 3)
            self.Phrase = false
          end        
          return _W_S
        end
      end
    end
    if self.VP_xin_DAing_ghi then      
      self.VP_xin_DAing_ghi = false
      VP_xin_DAList = nil
      self.PYListc = 1
      self.hdd = false
      self.zkYm_yj = true
    end      
  end
end
function VP_xin_:xzl__()
  if _j.f_RD then return 1
  elseif _j.f_RU then return 2
  elseif _j.f_RL then return 3
  elseif _j.f_RR then return 4
  elseif _j.f_LU then return 5
  elseif _j.f_LD then return 6
  elseif _j.f_LL then return 7
  elseif _j.f_LR then return 8
  elseif _j.f_ST then return true
  else return nil
  end
end
_PIV_IN = {
  Colors = {
    Text   = Color.new(  0,  0,  0),
    Bg     = Color.new(230,230,230),
    Line = Color.new(192,192,192),
    rDrsor = Color.new(  0,  0,180),
    __u_    = Color.new(200,200,255)
  },
  enige = Image.createEmpty(444, 241),
  _enige_ = {},
  _eni_ge_ = true,
  _en_ige_ = Image.createEmpty(480, 241),
}

_PIV_IN.Cyg = {
  Color.new(  0,  0,160),
  Color.new(  0,100,100),
  Color.new(  0,120,  0),
  Color.new(160,120,  0)
}

_PIV_IN._Cyg = {
  " function if then else elseif do end ",
  " for in repeat until while break return ",
  " local true false ",
  " not and or == ~= > < <= >= "
}
function _PIV_IN:ZCHd()
  self.Zbahi    = nil
  self.Replace   = false
  self.Rep_Text  = ""
  self.TabSize   = 2
  self.Coloring  = false
  self.rDrLine   = 1
  self.rDrwP    = 1
  self.OldrDrwP = 1
  self.hddRow = 0
  self.hddCol = 0
  self.ScrwP_x  = 0
  self.ScrwP_y  = 0
  self.xmf  = false
  self.sglm = true
  self._ffM_    = { "" }
  self.XinZ  = { __u_ected = false }
end
function _PIV_IN.new(_ERCn)
  if not _ERCn then
    _ERCn = {
      MU_tt = screen,
      cLbd = ""
    }
  end
  if _pbc_ then _ERCn.cLbd = _pbc_ end
  local coty = setmetatable({ _ERCn = _ERCn }, { __index = _PIV_IN })
  coty:ZCHd()
  return coty
end
function _PIV_IN:rt_Z_Ct_F(_Z_Ct_F, AI)
  local Text_Length = string.len(_Z_Ct_F)
  if Text_Length == nil then return end
  if Text_Length > 0 then
    self.xmf = true
    _PIV_IN._eni_ge_ = true
  end

  for c = 1, Text_Length do
    local bylz = string.sub(_Z_Ct_F, c, c)
    if bylz == "\b" then
      if self.rDrwP == 1 then
        if self.sglm and self.rDrLine > 1 then
          self.rDrLine = self.rDrLine - 1
          self.rDrwP  = string.len(self._ffM_[self.rDrLine]) + 1
          self._ffM_[self.rDrLine] = self._ffM_[self.rDrLine] .. 
          table.remove(self._ffM_, self.rDrLine + 1)
        end
      else
        local step = 1
        if (string.byte(self._ffM_[self.rDrLine], self.rDrwP - 1) or 0) > 127 then
          step = 2
        end
        self._ffM_[self.rDrLine] =
          string.sub(self._ffM_[self.rDrLine], 1, self.rDrwP - 1 - step) .. 
          string.sub(self._ffM_[self.rDrLine], self.rDrwP)
        self.rDrwP = self.rDrwP - step
      end
    elseif bylz == "\n" then
      if self.sglm then
        local Tmp = self._ffM_[self.rDrLine]
        local Part_one  = string.sub(Tmp, 1, self.rDrwP - 1)
        local Part_two  = string.sub(Tmp, self.rDrwP)
        self._ffM_[self.rDrLine] = Part_one
        self.rDrLine = self.rDrLine + 1
        self.rDrwP = 1
        if AI then
          self.rDrwP = string.find(Part_one, "[^ ]") or 1
          Part_two = string.rep(" ", self.rDrwP - 1) .. Part_two
        end        
        table.insert(self._ffM_, self.rDrLine, Part_two)
      end
    elseif bylz == "\t" then
      for c = 0, self.TabSize - 1 - math.mod(self.rDrwP - 1, self.TabSize) do
        self._ffM_[self.rDrLine] =
          string.sub(self._ffM_[self.rDrLine], 1, self.rDrwP - 1)
          .. " " ..
          string.sub(self._ffM_[self.rDrLine], self.rDrwP)
        self.rDrwP = self.rDrwP + 1
      end
    else
      self._ffM_[self.rDrLine] =
        string.sub(self._ffM_[self.rDrLine], 1, self.rDrwP-1)
        .. bylz ..
        string.sub(self._ffM_[self.rDrLine], self.rDrwP)
      self.rDrwP = self.rDrwP + 1
    end
  end
  self.OldrDrwP = self.rDrwP
end
function _PIV_IN:CanPqrDrsor()
  local H = _j:dDH_REZ()
  local V = _j:dDV_REZ()
  local Result = false

  if _j.RD then V = V * 10 ; H = H * 10 end

  if V ~= 0 then
    local Line = table.getn(self._ffM_)
    if _j.RL then
      if _j.tdLU then self.OldrDrwP = 1 ; self.rDrLine = 1 ; V = 0 end
      if _j.tdLD then self.OldrDrwP = 1 ; self.rDrLine = Line ; V = 0 end
    end
    self.rDrLine = _XX_(self.rDrLine + V, 1, Line)

    local Length = string.len(self._ffM_[self.rDrLine]) + 1
    self.rDrwP = self.OldrDrwP
    if self.rDrwP > Length then
      self.OldrDrwP = Length
      self.rDrwP = Length
    end
    if (string.byte(self._ffM_[self.rDrLine], self.rDrwP) or 0) > 127 then
      local _Z_Ct_F = self._ffM_[self.rDrLine]
      local Length = self.rDrwP
      repeat Length = Length - 1 until (string.byte(_Z_Ct_F, Length) or 0) < 128
      if Length == 0 then
        self.rDrwP = math.floor((self.rDrwP + 1) / 2) * 2 - 1
      else
        self.rDrwP = math.floor((self.rDrwP + 1) / 2) * 2 - (Length + 1)
      end
    end
    Result = true
  end

  if H ~= 0 then
    local Length = string.len(self._ffM_[self.rDrLine]) + 1
    if _j.RL then
      if _j.tdLL then self.rDrwP = 1 ; H = 0 end
      if _j.tdLR then self.rDrwP = Length ; H = 0 end
    end
    while H > 0 do
      if (string.byte(self._ffM_[self.rDrLine], self.rDrwP) or 0) > 127 then
        self.rDrwP = self.rDrwP + 1
      end
      self.rDrwP = self.rDrwP + 1
      H = H - 1
    end
    while H < 0 do
      if (string.byte(self._ffM_[self.rDrLine], self.rDrwP - 1) or 0) > 127 then
        self.rDrwP = self.rDrwP - 1
      end
      self.rDrwP = self.rDrwP - 1
      H = H + 1
    end
    if self.rDrwP < 1 then
      if self.rDrLine > 1 then
        self.rDrLine = self.rDrLine - 1
        self.rDrwP  = string.len(self._ffM_[self.rDrLine]) + 1
      else
        self.rDrwP  = 1
      end
    elseif self.rDrwP > Length then
      if self._ffM_[self.rDrLine + 1] then
        self.rDrLine = self.rDrLine + 1
        self.rDrwP  = 1
      else
        self.rDrwP  = Length
      end
    end
    self.OldrDrwP = self.rDrwP
    Result = true
  end
  return Result
end
function _PIV_IN:TSSGa()
  if self.XinZ.__u_ected == false then return end
  local Result
  if self.XinZ.MinLine == self.XinZ.MaxLine then
    Result = string.sub(self._ffM_[self.XinZ.MinLine],
      self.XinZ.MinwP, self.XinZ.MaxwP - 1)
  else
    Result = string.sub(self._ffM_[self.XinZ.MinLine],
      self.XinZ.MinwP) .. "\n"
    for c = self.XinZ.MinLine + 1, self.XinZ.MaxLine - 1 do
      Result = Result .. self._ffM_[c] .. "\n"
    end
    Result = Result ..
     string.sub(self._ffM_[self.XinZ.MaxLine], 1,
       self.XinZ.MaxwP - 1)
  end
  return Result
end
function _PIV_IN:G___u_ntan()
  local XinZ = self.XinZ
  XinZ.sglm = XinZ.ngba_Line ~= XinZ.End_Line
  if XinZ.sglm then
    XinZ.__u_ected = true
    if XinZ.ngba_Line < XinZ.End_Line then
      XinZ.MinLine, XinZ.MaxLine = XinZ.ngba_Line, XinZ.End_Line
      XinZ.MinwP , XinZ.MaxwP  = XinZ.ngba_wP , XinZ.End_wP
    else
      XinZ.MinLine, XinZ.MaxLine = XinZ.End_Line, XinZ.ngba_Line
      XinZ.MinwP , XinZ.MaxwP  = XinZ.End_wP , XinZ.ngba_wP
    end
  else
    XinZ.__u_ected = XinZ.ngba_wP ~= XinZ.End_wP
    XinZ.MinLine, XinZ.MaxLine = XinZ.ngba_Line, XinZ.ngba_Line
    if XinZ.ngba_wP < XinZ.End_wP then
      XinZ.MinwP, XinZ.MaxwP = XinZ.ngba_wP, XinZ.End_wP
    else
      XinZ.MinwP, XinZ.MaxwP = XinZ.End_wP, XinZ.ngba_wP
    end
  end
end
function _PIV_IN:tngcO()
  if self.XinZ.__u_ected == false then return end
  for c = self.XinZ.MinLine, self.XinZ.MaxLine do
    self._ffM_[c] = " " .. self._ffM_[c]
  end
  _PIV_IN._eni_ge_ = true
  self.xmf = true
end
function _PIV_IN:UntngcO()
  if self.XinZ.__u_ected == false then return end
  for c = self.XinZ.MinLine, self.XinZ.MaxLine do
    if string.find(self._ffM_[c], " ") == 1 then
      self._ffM_[c] = string.sub(self._ffM_[c], 2)
    end
  end
  _PIV_IN._eni_ge_ = true
  self.xmf = true
end
function _PIV_IN:Copy__u_ntan()
  local Result = self:TSSGa()
  if Result and self._ERCn then
    self._ERCn.cLbd = Result
    _pbc_ = Result
  end
end
function _PIV_IN:td_u_ntan()
  if self.XinZ.__u_ected == false then return end

  self._ffM_[self.XinZ.MinLine] =
      string.sub(self._ffM_[self.XinZ.MinLine], 1, self.XinZ.MinwP - 1)
    .. string.sub(self._ffM_[self.XinZ.MaxLine], self.XinZ.MaxwP)
  for c = 1, self.XinZ.MaxLine - self.XinZ.MinLine do
    table.remove(self._ffM_, self.XinZ.MinLine + 1)
  end
  self.rDrwP  = self.XinZ.MinwP
  self.rDrLine = self.XinZ.MinLine
  self.OldrDrwP = self.rDrwP
  self.XinZ.__u_ected = false
  self.xmf = true
  _PIV_IN._eni_ge_ = true
end
function _PIV_IN:Paste()
  if self._ERCn then self:rt_Z_Ct_F(self._ERCn.cLbd) end
end
function _PIV_IN:_Ctrl__()
  if self._Ctrl_ then
    self.rDrLine = self._Ctrl_.rDrLine
    self.rDrwP  = self._Ctrl_.rDrwP
    self._ffM_  = {}
    table.foreach(self._Ctrl_._ffM_,
      function(key, value)
        self._ffM_[key] = value
      end
    )
    self.XinZ.__u_ected = false
    self._Ctrl_ = nil
    _PIV_IN._eni_ge_ = true
  end
end
function _PIV_IN:Set_Ctrl__()
  self._Ctrl_ = {}
  self._Ctrl_.rDrLine = self.rDrLine
  self._Ctrl_.rDrwP  = self.rDrwP
  self._Ctrl_._ffM_  = {}
  table.foreach(self._ffM_,
    function(key, value)
      self._Ctrl_._ffM_[key] = value
    end
  )
end
function _PIV_IN:Load(Name)
  if Name == nil then return end
  if Name == ""  then return end
  self:ZCHd()
  self._ffM_ = {}
  for Data in io.lines(Name) do
    local Text = ""
    local TextdLength = string.len(Data)
    for c = 1, TextdLength do
      local bylz = string.sub(Data, c, c)
      if bylz == "\r" then
        bylz = ""
      elseif bylz == "\t" then
        bylz = "  "
      end
      Text = Text .. bylz
    end
    table.insert(self._ffM_, Text)
  end
  _PIV_IN._eni_ge_ = true
end
function _PIV_IN:Save(Name)
  if Name == nil then return end
  if Name == ""  then return end
  io.output(Name)
  table.foreachi(self._ffM_,
    function(key, value)
      if key ~= 1 then
        io.write("\n"..value)
      else
        io.write(value)
      end
    end
  )
  io.close()
  self.xmf = false
end
function _PIV_IN:Ma_Ha_j()
  if not self._ffM_ then return end

  if _PIV_IN.Last__u_f ~= self then
    _PIV_IN._eni_ge_ = true
    _PIV_IN.Last__u_f = self
  end

  local fba_Line = table.getn(self._ffM_)

  local Int = self.hddRow
  local Div = self.rDrLine - self.hddRow
  if Div < 6  then self.hddRow = self.hddRow + Div - 6  end
  if Div > 18 then self.hddRow = self.hddRow + Div - 18 end
  self.hddRow = math.max(self.hddRow, 0)
  if Int ~= self.hddRow then _PIV_IN._eni_ge_ = true end

  Int = self.hddCol
  Div = self.rDrwP - self.hddCol
  if self.rDrwP == 1 then self.hddCol = 1 end
  if Div < 5  then self.hddCol = self.hddCol - 10 end
  if Div > 75 then self.hddCol = self.hddCol + 10 end
  self.hddCol = math.max(self.hddCol, 0)
  if Int ~= self.hddCol then _PIV_IN._eni_ge_ = true end

  local H_Start = self.hddCol + 1
  local H_End   = H_Start + 73

  if _PIV_IN._eni_ge_ then
    local MU_tt = _PIV_IN._en_ige_
    local Skin   = self._ERCn.Skin
    local Line   = 1 + self.hddRow
    local Tmp_Cache = {}
    local Used   = {}
    local Unused = {}

    MU_tt:clear()

    for c = 2, 230, 12 do
      if Line > fba_Line then break end
      local Tmp = self._ffM_[Line]
      local DispStr = string.sub(Tmp, H_Start, H_End)
      local TX_EI_dhm = _PIV_IN._enige_[DispStr]
      if TX_EI_dhm then Used[TX_EI_dhm] = true end
      Line = Line + 1
    end

    for c = 0, 19 do
      if not Used[c] then
        table.insert(Unused, c)
      end
    end

    local _djgd_ = 1
    Line = 1 + self.hddRow
    for c = 1, 230, 12 do
      if Line > fba_Line then break end
      local Tmp = self._ffM_[Line]
      local DispStr = string.sub(Tmp, H_Start, H_End)
      local TX_EI_dhm = _PIV_IN._enige_[DispStr]

      if not TX_EI_dhm then
        TX_EI_dhm = Unused[_djgd_]
        _PIV_IN._enige_[DispStr] = TX_EI_dhm
        _djgd_ = _djgd_ + 1

        local TX_EI_ = _PIV_IN.enige
        TX_EI_:fillRect(0, TX_EI_dhm * 12, 444, 12)
        _PzT_:xPzP_(0, TX_EI_dhm * 12, DispStr, TX_EI_, self.Colors.Text)

        if self.Coloring then
          for c, _Z_Ct_F in self._Cyg do
            local col = self.Cyg[c]
            string.gsub(DispStr, "()([%a%p]+)",
              function(pos, word)
                if string.find(_Z_Ct_F, " " .. word .. " ", 1, true) then
                  _PzT_:xPzP_(pos * 6 - 6, TX_EI_dhm * 12, word, TX_EI_, col)
                end
              end
            )
          end
        end
      end
      Tmp_Cache[DispStr] = TX_EI_dhm
      
      local TextdLine
      if Line > 9999 then TextdLine = "----"
      else
        TextdLine = string.format("%4d", Line)
      end
      _PzT_:xPzP_(1, c, TextdLine, MU_tt)
      MU_tt:blit(28, c, _PIV_IN.enige, 0, TX_EI_dhm * 12, 444, 12)
      Line = Line + 1
    end
    _PIV_IN._enige_ = Tmp_Cache

    MU_tt:drawLine(25, 0, 25, 240, self.Colors.Line)

    local hddDown = (self.hddRow + 20) / fba_Line
    hddDown = math.min(237, 4 + hddDown * 233)
    local Bar_Length = _XX_(math.floor((20 / fba_Line) * 233) + 4, 1, 237)
    MU_tt:blit(472, hddDown - Bar_Length, Skin, 464, 16, 8, Bar_Length, false)
    MU_tt:blit(472, hddDown, Skin, 464, 268, 8, 4, false)

    _PIV_IN._eni_ge_ = false
  end

  do
    local MU_tt = self._ERCn.MU_tt
    local XinZ  = self.XinZ
    local __u_ = XinZ.__u_ected
    local Line= 1 + self.hddRow

    for c = 17, 245, 12 do
      if Line > fba_Line then break end
      local Tmp = self._ffM_[Line]

      if __u_ then
        if Line >= XinZ.MinLine and Line <= XinZ.MaxLine then
          MU_tt:fillRect(28, _XX_(c, 16, 262),
            _XX_((string.len(Tmp) - H_Start) * 6 + 12, 0, 444), 12, self.Colors.__u_)
        end
        if Line == XinZ.MinLine then
          MU_tt:fillRect(28, c,
            (XinZ.MinwP - H_Start) * 6, 12, self.Colors.Bg)
        end
        if Line == XinZ.MaxLine then
          local x = math.max(28, (XinZ.MaxwP - H_Start) * 6 + 28)
          MU_tt:fillRect(x, c, 472 - x, 12, self.Colors.Bg)
        end
      end
      Line = Line + 1
    end

    MU_tt:blit(0, 16, _PIV_IN._en_ige_)

    local x = (self.rDrwP  - self.hddCol) * 6 + 22
    local y = (self.rDrLine - self.hddRow) * 12 + 6
    MU_tt:drawLine(0, y + 10, 471, y + 10, self.Colors.Line)
    MU_tt:drawLine(_XX_(x - 1, 27, 471), y - 1, _XX_(x - 1, 27, 471), y + 9, self.Colors.rDrsor)
    self.ScrwP_x, self.ScrwP_y = x, y
  end
end
function _PIV_IN:Ma_Ha_jEditBox(Width, msg)
  local MU_tt = self._ERCn.MU_tt
  local y = 100
  local w = Width * 6
  local x = (480 - w) / 2
  local Div = self.rDrwP - self.hddCol
  if Div < 1  then self.hddCol = self.hddCol + Div - 1  end
  if Div > Width then self.hddCol = self.hddCol + Div - Width - 1 end
  if self.hddCol < 0 then self.hddCol = 0 end

  self._ERCn:Ma_Ha_jForm(x - 8, y - 22, w + 16, 86, msg)
  _HzF(MU_tt, x - 3, y - 2, w + 6, 15, self.Colors.Line)
  MU_tt:fillRect(x - 2, y - 1, w + 5, 14, _bw)
  MU_tt:blit(x - 2, y + 20, self._ERCn.Buttons, 3 * 18, 0, 18, 18)
  _PzT_:xPzP_(x + 25, y + 24, "OK")
  MU_tt:blit(x - 2, y + 40, self._ERCn.Buttons, 0, 0, 18, 18)
  _PzT_:xPzP_(x + 25, y + 44, "Cancel")

  if self.XinZ.__u_ected then
    local MinX = _XX_((self.XinZ.MinwP - self.hddCol), 1, Width)
    local MaxX = _XX_((self.XinZ.MaxwP - self.hddCol), 0, Width + 1)
    MU_tt:fillRect(MinX * 6 + x - 6, y, (MaxX - MinX) * 6, 12, self.Colors.__u_)
  end

  _PzT_:xPzP_(x, y, string.sub(self._ffM_[1], self.hddCol + 1, self.hddCol + Width))

  x = (self.rDrwP - self.hddCol) * 6 + x - 6
  MU_tt:drawLine(x - 1, y, x - 1, y + 11, self.Colors.rDrsor)
end
function _PIV_IN:DoZbahi(Keyword, DIR)
  if Keyword == nil or Keyword == "" then return true end
  local Length = string.len(Keyword)
  local Linesdhm = table.getn(self._ffM_)
  local Line = self.rDrLine
  local wP  = self.rDrwP
  local ReFind = function(Source, Pattern, Offers)
    if Offers < 1 then Offers = string.len(Source) end
    local Found = string.find(Source, Pattern, 1, true)
    if Found == nil then return end
    if Found > Offers then return end

    local Length = string.len(Pattern) - 1
    Offers = Offers - Length
    while Offers > 0 do
      if string.sub(Source, Offers, Offers + Length) == Pattern then
        return Offers
      end
      Offers = Offers - 1
    end
  end

  for c = 0, Linesdhm do
    local __u_
    if DIR < 0 then
      __u_ = ReFind(self._ffM_[Line], Keyword, wP - 2)
    else
      __u_ = string.find(self._ffM_[Line], Keyword, wP, true)
    end
    if __u_ ~= nil then
      self.rDrLine = Line
      self.rDrwP  = __u_ + Length
      self.XinZ.ngba_Line = Line
      self.XinZ.ngba_wP  = __u_
      self.XinZ.End_Line = Line
      self.XinZ.End_wP  = __u_ + Length
      self:G___u_ntan()
      return true
    end
    wP  = 1
    Line = Line + DIR
    if Line > Linesdhm then Line = 1 end
    if Line < 1 then Line = Linesdhm end
  end
end
function _PIV_IN:QuickZbahi(DIR)
  local __u_ = self:TSSGa()
  if __u_ then self.Zbahi = __u_ end
  local Result = self:DoZbahi(self.Zbahi, DIR)
  
  if self.Replace then
    self.Replace = Result
      if self.Replace then
        self:Set_Ctrl__()
        self:td_u_ntan()
        self:rt_Z_Ct_F(self.Rep_Text)
      end
  end
  if not Result then self._ERCn:MsgBox("  Pattern not Found.  ", 2) end
end
function _PIV_IN:dost(In)
  if In then
    self:Set_Ctrl__()
    if In == " " and
        self.XinZ.__u_ected and
        self.XinZ.sglm then
      self:tngcO()
    elseif In == "\t" and
        self.XinZ.__u_ected and
        self.XinZ.sglm then
      self:UntngcO()
    elseif In == "\b" and
        self.XinZ.__u_ected then
      self:td_u_ntan()
    else
      self:td_u_ntan()
      self:rt_Z_Ct_F(In, true)
    end
  end
end
function _PIV_IN:PR_TD_a()
  if _j.L then
    if _j.adRU then
      self:Set_Ctrl__()
      self:Copy__u_ntan()
      self:td_u_ntan()
      self.XinZ.__u_ected = false
    end
    if _j.adRL then
      self:Set_Ctrl__()
      self:Copy__u_ntan()
      self.XinZ.__u_ected = false
    end
    if _j.adRD then
      self:_Ctrl__()
    end
    if self._ERCn and self._ERCn.cLbd ~= "" and _j:kd(_j.pyr) then
      self:Set_Ctrl__()
      self:td_u_ntan()
      self:Paste()
      self.XinZ.__u_ected = false
    end
  else
    if _j.RR then
      local V = _j:dDV_REZ()
      if V ~= 0 then self:QuickZbahi(V) end
      return
    end
  end

  if not self.XinZ.__u_ected then
    self.XinZ.ngba_Line = self.rDrLine
    self.XinZ.ngba_wP  = self.rDrwP
  end

  if self:CanPqrDrsor() then
    if _j.L then
      self.XinZ.End_Line = self.rDrLine
      self.XinZ.End_wP  = self.rDrwP
      self:G___u_ntan()
    else
      self.XinZ.__u_ected = false
    end
  end
end
do
  local Init = Image.load("Images/Init.png")
  screen:clear(Color.new(255,255,255))
  screen:blit(160, 75, Init)
  screen:flip()
end
_tMU_tt = {  
  Icons = Image.load("Images/Icons.png"),
  _D_Q_W_djgd_ = 1,
  Start_djgd_ = 1,
  _tMU_t_t = {},
   _D_Q_W_Dir = ""
}
function _tMU_tt:G_Dir()
  local SortProc = function(a, b)
    if a.directory == b.directory then return string.lower(a.name) < string.lower(b.name) end
    return a.directory
  end  
  self._D_Q_W_djgd_ = 1
  self.Start_djgd_ = 1  
  self._D_Q_W_Dir = System.currentDirectory()
  self._tMU_t_t = System.listDirectory()
  table.sort(self._tMU_t_t, SortProc)
  table.remove(self._tMU_t_t, 1)
  self:SetIcon()
end
function _tMU_tt:ZCHd()
  self._D_Q_W_djgd_ = 1
  self.Start_djgd_ = 1
  self:G_Dir()
  self:Ma_Ha_j()
end
function _tMU_tt:SetIcon()
  for _djgd_, File in ipairs(self._tMU_t_t) do
    if File.directory then
      File.CaPq = 1
    else
      if string.lower(string.sub(File.name, -4)) == ".lua" then
        File.CaPq = 5
      elseif string.lower(string.sub(File.name, -4)) == ".png" or
        string.lower(string.sub(File.name, -4)) == ".jpg" then
        File.CaPq = 4
      elseif string.lower(string.sub(File.name, -4)) == ".txt" then
        File.CaPq = 3
      else
        File.CaPq = 2
      end
    end
  end
end
function _tMU_tt:ChangeDir(cotyDir)
  System.currentDirectory(cotyDir)
  self:G_Dir()
end
function _tMU_tt:Ma_Ha_j()
  local x = 41
  local y = 28
  local Dir_name = "MS:" .. string.sub(self._D_Q_W_Dir, 5)
  _ERCn:Ma_Ha_jForm(30, 25, 420, 220, Dir_name)
  screen:fillRect(x - 4, y + 16, 405, 177, _bw)
  _HzF(screen, x - 5, y + 15, 407, 179, Color.new(112,110,100))
  _HzF(screen, x - 6, y + 14, 408, 180, Color.new(172,168,152))
  screen:drawLine(405 + x - 2, y + 16, 405 + x - 2, 177 + y + 15, _bw)
  screen:blit(160, 224, _ERCn.Buttons, 18 * 1, 0, 18, 18)
  LmGdG_:_in_oN(180, 228, "Delete")
  screen:blit(255, 224, _ERCn.Buttons, 18 * 3, 0, 18, 18)
  LmGdG_:_in_oN(275, 228, "Select")
  screen:blit(350, 224, _ERCn.Buttons, 18 * 0, 0, 18, 18)
  LmGdG_:_in_oN(370, 228, "Cancel")
  y = y + 20
  for c = self.Start_djgd_, math.min(self.Start_djgd_ + 9, table.getn(self._tMU_t_t)) do
    File = self._tMU_t_t[c]
    if c == self._D_Q_W_djgd_ then
      screen:fillRect(x + 18, y, string.len(File.name) * 6 + 4, 16, Color.new(200,200,200))
    end
    screen:blit(x, y, self.Icons, File.CaPq * 16 - 16, 0, 16, 16)
    _PzT_:xPzP_(x + 20, y + 2, File.name)
    y = y + 17
  end

  screen.flip()
end
function _tMU_tt:G_()
  _j:G_()
  local V = _j:dDV_REZ()
  if V < 0 and self._D_Q_W_djgd_ > 1 then
    self._D_Q_W_djgd_ = self._D_Q_W_djgd_ - 1
    self.Start_djgd_ = math.min(self._D_Q_W_djgd_, self.Start_djgd_)
  elseif V > 0 then
    if self._D_Q_W_djgd_ < table.getn(self._tMU_t_t) then
      self._D_Q_W_djgd_ = self._D_Q_W_djgd_ + 1
      if (self._D_Q_W_djgd_ - self.Start_djgd_) > 9 then
        self.Start_djgd_ = self.Start_djgd_ + 1
      end
    end
  elseif _j.tdLR or _j.adRR then
    if self._tMU_t_t[self._D_Q_W_djgd_].directory then
      self:ChangeDir(self._tMU_t_t[self._D_Q_W_djgd_].name)
    else
      return System.currentDirectory() .. "/" .. self._tMU_t_t[self._D_Q_W_djgd_].name
    end
  elseif _j.tdLL then
    self:ChangeDir("..")
  elseif _j.adRU then
        if self:MsgBox("    Are you sure?    ", 1) == 0 then
      if self._tMU_t_t[self._D_Q_W_djgd_].directory then
        System.removeDirectory(self._tMU_t_t[self._D_Q_W_djgd_].name)
      else
        System.removeFile(self._tMU_t_t[self._D_Q_W_djgd_].name)
      end
      self:G_Dir()
    end
  end
  self:Ma_Ha_j()
end
function _tMU_tt:Open()
  local Result = nil
  self:ZCHd()
  while not _j.RD do
    Result = self:G_()
    if Result then break end
  end
  screen:flip()
  return Result
end
function _tMU_tt:MsgBox(Prompt, Style, _Title)
  local Title = {
    "Confirm", "Information", "Warning", "Error"
  }
while true do
    _j:G_()
    if _Title then Title[Style] = _Title end
    _ERCn:Ma_Ha_jForm(140, 100, 200, 100, Title[Style])
    LmGdG_:_in_oN(170, 138, Prompt, 350)
    if Style == 1 then
      screen:blit(185, 174, _ERCn.Buttons, 18 * 3, 0, 18, 18)
      LmGdG_:_in_oN(205, 178, "Yes")
      screen:blit(260, 174, _ERCn.Buttons, 18 * 0, 0, 18, 18)
      LmGdG_:_in_oN(280, 178, "No")
    end
    if Style > 1 then
      screen:blit(210, 174, _ERCn.Buttons, 18 * 3, 0, 18, 18)
      LmGdG_:_in_oN(250, 178, "OK")
    end

    screen:flip()
    if _j.f_RR then return 0
    elseif _j.f_RD then return 1
    end
  end
end
_ERCn = {
  BaseDir   = System.currentDirectory(),
  Skin      = Image.load("Images/Skin.png"),
  OSK       = Image.load("Images/OSK.png"),
  Buttons   = Image.load("Images/Buttons.png"),
  StatesMsg = {"", "关闭", "帮助按方块+叉"},
  File_Menu = {
    "New",
    "Open ...",
    "Save",
    "Save as ...",
    "Close",
    "Exit"
  },
  Edit_Menu = {
    "Search ...",
    "Replace ...",
    "Jump to ...",
    "Select all",
    "Syntax coloring ...",
    "About"
  }
}
_ERCn.Symbol = {
  "　，。：；？、…‘’“”〔〕〈〉《》「」『』〖〗【】±×÷┈",
  "！＂＃￥％＆＇（）＊＋－．／０１２３４５６７８９＜＝＞＠｀＿",
  "ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ［＼］＾",
  "ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ｛｜｝￣",
  "‖∧∨∑∏∪∩∈∷√⊥∥∠⌒⊙∫∮≡≌≈∽∝≠≮≯≤≥∞∵∴",
  "ⅰⅱⅲⅳⅴⅵⅶⅷⅸⅹ⒈⒉⒊⒋⒌⒍⒎⒏⒐⒑⒒⒓⒔⒕⒖⒗⒘⒙⒚⒛",
  "⑴⑵⑶⑷⑸⑹⑺⑻⑼⑽⑾⑿⒀⒁⒂⒃⒄⒅⒆⒇①②③④⑤⑥⑦⑧⑨⑩",
  "㈠㈡㈢㈣㈤㈥㈦㈧㈨㈩ⅠⅡⅢⅣⅤⅥⅦⅧⅨⅩⅪⅫ～·ˉˇ¨〃々—",
  "♂♀°′″℃＄¤￠￡‰§№☆★○●◎◇◆□■△▲※→←↑↓〓",
  "┌┬┐─│├┼┤└┴┘┏┳┓━┃┣╋┫┗┻┛"
}

_ERCn.Dictionary = {
  {
    "",
    "if then",
    "else",
    "for =, do",
    "break",
    "function ()",
    "local ",
    "return",
    "repeat",
    "until ",
    "while  do",
    "do",
    "end"
  }, {
    "--",
    "==",
    "~=",
    ">",
    "<",
    ">=",
    "<=",
    "()",
    "[]",
    "..",
    "or",
    "and",
    "not"
  }, {
    ":clear()",
    ":blit(, , )",
    ":drawLine(, , , , )",
    ":fillRect(, , , , )",
    ":pixel(, , )",
    ":print(, , , )",
    ":save()",
    ":waitVblankStart()"
  }, {
    "string.byte(, )",
    "string.char()",
    "string.dump()",
    "string.find(, )",
    "string.format(, )",
    "string.gfind(, )",
    "string.gsub(, , )",
    "string.len()",
    "string.lower()",
    "string.rep(, )",
    "string.sub(, )",
    "string.upper(, )"
  }
}


function _ERCn.new(_hO_)
  if _hO_ == nil then _hO_ = screen end
  local coty = setmetatable({
    blae  = true,
    cLbd  = "",
    MU_tt     = _hO_,
    fbadhm = 1,
    _ffM_s    = {},
    FileName   = {} },
    { __index = _ERCn } )

  if _pbc_ then coty.cLbd = _pbc_ end
  coty:coty()
  return coty
end
function _ERCn:_ERCnRR(Msg, Width, Source)
  local OSK = VP_xin_.new()
  local Sub_ffM_ = _PIV_IN.new(self)
  Sub_ffM_.sglm = false
  if Source then
    Sub_ffM_._ffM_[1] = Source
    Sub_ffM_.XinZ.ngba_Line = 1
    Sub_ffM_.XinZ.ngba_wP  = 1
    Sub_ffM_.rDrLine = table.getn(Sub_ffM_._ffM_)
    Sub_ffM_.rDrwP = string.len(Sub_ffM_._ffM_[Sub_ffM_.rDrLine]) + 1
    Sub_ffM_.XinZ.End_Line = Sub_ffM_.rDrLine
    Sub_ffM_.XinZ.End_wP  = Sub_ffM_.rDrwP
    Sub_ffM_:G___u_ntan()
  end
  while true do
    _j:G_()
    self:Ma_Ha_j()
    if _j.adR and not _j.L and not OSK.Scorll then OSK.ouh_ = not(OSK.ouh_) end
    if OSK.ouh_ then
      self.StatesMsg[1] = "Press __u_ect to change Input method"
      if OSK.zkYm_C then self.StatesMsg[2] = "拼音"
      elseif OSK.zkYm_yj then self.StatesMsg[2] = "English"
      end
      local In = OSK:G_()
      OSK:Ma_Ha_j(screen, 337, 187)
      Sub_ffM_:dost(In)
    else
      self.StatesMsg[2] = "Closed"
      self.StatesMsg[1] = "You can use L + Circle to paste"
      Sub_ffM_:PR_TD_a()
      if _j.adRR and not _j.L then self.StatesMsg[1] = "" return Sub_ffM_._ffM_[1] end
      if _j.adRD and not _j.L then self.StatesMsg[1] = "" return nil end
    end
    Sub_ffM_:Ma_Ha_jEditBox(Width, Msg)
    self:Flip()
  end
end
function _ERCn:Confirm()
  if self._ffM_s[self.fbadhm].xmf then
    return self:MsgBox("File modified, Discard?", 1) == 0
  else
    return true
  end
end
function _ERCn:Ma_Ha_jMain()
  local curp = self._ffM_s[self.fbadhm]
  local MU_tt = self.MU_tt
  MU_tt:blit(0, 0, self.Skin)
  MU_tt:fillRect(26, 16, 446, 241, curp.Colors.Bg)
  MU_tt:blit(0, 272 - 15, self.Skin, 0, 1, 480, 15)
  MU_tt:blit(415, 272 - 13, self.OSK)
  if self.StatesMsg[1] == "" then self.StatesMsg[1] = self.StatesMsg[3] end
  _PzT_:xPzP_(10, 272 - 13, self.StatesMsg[1])
  _PzT_:xPzP_(440, 272 - 13, self.StatesMsg[2])

  local FileName = string.sub(curp.FileName or "", 5)
  if FileName == "" then
    FileName = "[新建文本文档]"
  else
    if string.sub(FileName, 1, 2) == "//" then
      FileName = string.sub(FileName, 2) end
    FileName = "[MS:" .. FileName .. "]"
  end
  if string.len(FileName) > 46 then FileName = "[..." .. string.sub(FileName, - 46) end
  _PzT_:xPzP_(7, 2, "[" .. self.fbadhm .. "]" .."-" .. FileName)
  if self._ffM_s[self.fbadhm].xmf then
    _PzT_:xPzP_(2, 2, "*")
  end  
end
function _ERCn:Ma_Ha_j()
  self:Ma_Ha_jMain()
  self._ffM_s[self.fbadhm]:Ma_Ha_j()
end
function _ERCn:MsgBox(Prompt, Style, _Title)
  local Title = {
    "Confirm", "Information", "Warning", "Error"
  }
 
  while true do
    _j:G_()
    self:Ma_Ha_j()
    if _Title then Title[Style] = _Title end
    self:Ma_Ha_jForm(140, 100, 200, 100, Title[Style])
    LmGdG_:_in_oN(170, 138, Prompt, 350)
    if Style == 1 then
      self.MU_tt:blit(185, 174, self.Buttons, 18 * 3, 0, 18, 18)
      LmGdG_:_in_oN(205, 178, "Yes")
      self.MU_tt:blit(260, 174, self.Buttons, 18 * 0, 0, 18, 18)
      LmGdG_:_in_oN(280, 178, "No")
    end
    if Style > 1 then
      self.MU_tt:blit(210, 174, self.Buttons, 18 * 3, 0, 18, 18)
      LmGdG_:_in_oN(250, 178, "OK")
    end
    self:Flip()
    if _j.adRR then return 0
    elseif _j.adRD then return 1
    elseif _j.adRL then return 2 end
  end
end
function _ERCn:Ma_Ha_jForm(x, y, w, h, Title)
  local MU_tt = screen
  local Form = self.Skin
  MU_tt:blit(x, y, Form, 0, 0, w - 10, h - 10)
  MU_tt:blit(x, y + (h - 10), Form, 0, 272 - 10, w - 10, 10)
  MU_tt:blit(x + (w - 10), y, Form, 480 - 50, 0, 10, h - 10)
  MU_tt:blit(x + (w - 10), y + (h - 10), Form, 480 - 50, 272 - 10, 10, 10)
  _HzF(MU_tt, x, y, w, h, Color.new(104,104,104))
  _HzF(MU_tt, x + 1, y + 15, w - 2, h - 16, _bw)
  screen:drawLine(x + w - 1, y + 15, x + w - 1, y + h - 1, Color.new(165,165,165))
  screen:drawLine(x + 1, y + h - 1, x + w - 2, y + h - 1, Color.new(165,165,165))
  if Title then LmGdG_:_in_oN(x + 3, y + 2, Title) end
end
function _ERCn:ShowMenu(List, Title)
  local hdd = 1
  local __u_ = 1
  local Listdhm_ = table.getn(List)

  while true do
    _j:G_()
    self:Ma_Ha_j()

    if _j.adRD or _j.tST then self.StatesMsg[1] = "" return nil end
    if _j.adRR then self.StatesMsg[1] = "" return __u_ end

    __u_ = __u_ + _j:dDV_REZ()
    if __u_ < 1 then __u_ = Listdhm_ end
    if __u_ > Listdhm_ then __u_ = 1 end
    if hdd > __u_     then hdd = __u_     end
    if hdd < __u_ - 8 then hdd = __u_ - 8 end

    self:Ma_Ha_jForm(120, 100, 240, 100, Title)

    for c = 1, 7 do
      local Itemdhm_ = c + hdd - 1
      local Item = List[Itemdhm_]
if Item then
        if Itemdhm_ == __u_ then xtDyS_ = _hb else xtDyS_ = D_Hsa end
        LmGdG_:_in_oN(130, 108 + c * 12, Item, 480, self.MU_tt, xtDyS_)
      end
    end
    self.StatesMsg[1] = List[__u_]
    self:Flip()
  end
end
function _ERCn:ViewPicture(FileName)
  local Bg  = Image.createEmpty(480, 272)
  local Pic = Image.load(FileName)
  local w = 240 - Pic:width() / 2
  local h = 136 - Pic:height() / 2
  local x, y = 0, 0
  local Dark = Color.new(210, 210, 210)
  local Light = Color.new(240, 240, 240)
  Bg:fillRect(0, 0, 480, 272, Light)
  for c = 0, 464, 16 do
    for p = 0, 256, 16 do
      Bg:fillRect(c, p, 8, 8, Dark)
      Bg:fillRect(c + 8, p + 8, 8, 8, Dark)
    end
  end

  repeat
    _j:G_()
   x = x + _j:dDH_REZ()
    y = y + _j:dDV_REZ()
    screen:blit(0, 0, Bg, 0, 0, 480, 272, false)
    screen:blit(w + x, h + y, Pic)
    self:Flip()
  until _j.adRD
end
function _ERCn:coty()
  local coty = _PIV_IN.new(self)
  table.insert(self._ffM_s, coty)
  self.fbadhm = table.getn(self._ffM_s)
  return coty
end
function _ERCn:Open()
  local cotyName = _tMU_tt:Open()
  if cotyName then
    local _Name = string.lower(cotyName)
  if string.find(_Name, ".png$") or
      string.find(_Name, ".jpg$") then
      self:ViewPicture(cotyName)
    else
      self:coty()
      self._ffM_s[self.fbadhm]:Load(cotyName)
      self._ffM_s[self.fbadhm].FileName = cotyName
    end
  end
end

function _ERCn:Close()
  table.remove(self._ffM_s, self.fbadhm)
  self.fbadhm = table.getn(self._ffM_s)
  if self.fbadhm == 0 then self:coty() end
end

function _ERCn:FileMenu()
  local __u_ = self:ShowMenu(self.File_Menu, "File")
  local curp = self._ffM_s[self.fbadhm]

  if __u_ == 1 then self:coty() end
  if __u_ == 2 then
    self:Flip()
    self:Open()
  end

  if __u_ == 3 then
    if not curp.FileName then
      __u_ = 4
    else
      curp:Save(curp.FileName)
    end
  end

  if __u_ == 4 then
    local cotyName =
     self:_ERCnRR("Input file name", 30, ".TXT")
  if cotyName then
      curp:Save(cotyName)
      curp.FileName = System.currentDirectory() .. "/" .. cotyName
    end
  end

  if __u_ == 5 then
    if self:Confirm() then self:Close() end
  end
  if __u_ == 6 then
    if self:Confirm() then
      if self:MsgBox("Do you want to exit?", 1) == 0 then
     self.blae = false
      end
    end
  end
end



function _ERCn:EditMenu()
  local __u_ = self:ShowMenu(self.Edit_Menu, "Edit")
  local curp = self._ffM_s[self.fbadhm]

  if __u_ == 1 then self:ZbahiText() end
  if __u_ == 2 then self:ReplaceText() end
  if __u_ == 3 then self:JumpTo() end
  if __u_ == 4 then self:__u_ectAll() end
  if __u_ == 5 then self:Syntax_Coloring() end
  if __u_ == 6 then self:MsgBox("   Notepad for PSP\n   YaoYang.  2008.10",
                               2, "About") end
end
function _ERCn:ZbahiText()
  local curp = self._ffM_s[self.fbadhm]
  curp.Zbahi = self:_ERCnRR("Search", 30, curp:TSSGa())
  local Result = curp:DoZbahi(curp.Zbahi, 1)
  if not Result then self:MsgBox("  Pattern not Found.  ", 2) end  
end
function _ERCn:ReplaceText()
  local curp = self._ffM_s[self.fbadhm]
  curp.Zbahi = self:_ERCnRR("Search", 30, curp:TSSGa())
  if curp.Zbahi == nil then return end
  curp.Rep_Text = self:_ERCnRR("Replace with", 30)
  local Result = curp:DoZbahi(curp.Zbahi, 1)
  curp.Replace = Result
  if curp.Replace then
    curp:Set_Ctrl__()
    curp:td_u_ntan()
    curp:rt_Z_Ct_F(curp.Rep_Text)
  end
  if not Result then self:MsgBox("  Pattern not Found.  ", 2) end
end
function _ERCn:JumpTo()
  local Line = self:_ERCnRR("Jump to", 12, "1")
  local curp = self._ffM_s[self.fbadhm]
  if Line then
    Line = tonumber(Line)
    if Line then
      curp.rDrLine = math.min(math.max(Line, 1),
        table.getn(curp._ffM_))
      curp.rDrwP = 1
    end
  end
end

function _ERCn:__u_ectAll()
  local curp = self._ffM_s[self.fbadhm]
  curp.XinZ.ngba_Line = 1
  curp.XinZ.ngba_wP  = 1
  curp.rDrLine = 1
  curp.rDrwP = 1
  local Line = table.getn(curp._ffM_)
  curp.XinZ.End_Line = Line
  curp.XinZ.End_wP  = string.len(curp._ffM_[Line]) + 1
  curp:G___u_ntan()
end

function _ERCn:Syntax_Coloring()
  local curp = self._ffM_s[self.fbadhm]  
  local OrgLine, OrgwP = curp.rDrLine, curp.rDrwP
  curp.Coloring = self:MsgBox("Use Syntax coloring?", 1, "Syntax Coloring") == 0
  _PIV_IN._eni_ge_ = true
  _PIV_IN._enige_ = {}
end


function _ERCn:Flip()
  screen.flip()
end


function _ERCn:__u_ectbylz()
  local V = 1
  local H = 1
  local Listdhm_ = table.getn(self.Symbol)
  local curp = self._ffM_s[self.fbadhm]
  local MU_tt = self.MU_tt
  self.StatesMsg[1] = "Insert symbol"
  while true do
    _j:G_()
    self:Ma_Ha_j()
    if _j:kd(_j.pzd) then V = V + 1 end
    if _j:kd(_j.pzu) then V = V - 1 end
    if _j:kd(_j.pzr) then H = H + 1 end
    if _j:kd(_j.pzl) then H = H - 1 end
    if V > Listdhm_ then V = 1
  elseif V < 1 then V = Listdhm_
    elseif H > string.len(self.Symbol[V]) / 2 then H = 1
    elseif H < 1 then H = string.len(self.Symbol[V]) / 2 end
    
    self:Ma_Ha_jForm(45, 25, 380, 220, "Insert Symbol")
    self.MU_tt:blit(215, 204, self.Buttons, 18 * 3, 0, 18, 18)
    LmGdG_:_in_oN(235, 208, "Insert symbol")
    self.MU_tt:blit(330, 204, self.Buttons, 18 * 0, 0, 18, 18)
    LmGdG_:_in_oN(350, 208, "Cancel")
  local Len = string.len(self.Symbol[1])
    MU_tt:fillRect(55, 46, Len * 6, Listdhm_ * 12, _bw)
    _HzF(MU_tt, 54, 45, Len * 6 + 2, Listdhm_ * 12 + 2, Color.new(112,110,100))
    _HzF(MU_tt, 53, 44, Len * 6 + 3, Listdhm_ * 12 + 3, Color.new(172,168,152))
    MU_tt:drawLine(Len * 6 + 57, 46, Len * 6 + 57, Listdhm_ * 12 + 45, _bw)
    
    MU_tt:fillRect(H * 12 + 43, V * 12 + 34, 13, 13, _lb)
    for c = 1, Listdhm_ do
      _PzT_:xPzP_(55, 35 + (c * 12), self.Symbol[c])
    end
    self:Flip()
    if _j.adRD then self.StatesMsg[1] = "" return nil end
    if _j.adRR then
    self.StatesMsg[1] = ""
    curp:rt_Z_Ct_F(string.sub(self.Symbol[V], H * 2 - 1, H * 2))
    break
  end
  end
end



function _ERCn:tiq()
  local Category, __u_ = 1, 1
 local curp = self._ffM_s[self.fbadhm]
  local moved = false

  curp.XinZ.ngba_Line = curp.rDrLine
  curp.XinZ.ngba_wP  = curp.rDrwP
  curp.XinZ.End_Line = curp.rDrLine
  curp.XinZ.End_wP  = curp.rDrwP
  curp:G___u_ntan()
 curp:Set_Ctrl__()

  while true do
    _j:G_()
    self:Ma_Ha_j()

    if not _j.RU then
      if not moved then self:__u_ectbylz() end
      break
    end

  local H = _j:dDH_REZ()
    local V = _j:dDV_REZ()

    if H ~= 0 then
      local Num = table.getn(self.Dictionary)
      Category = Category + H
    if Category < 1 then Category = Num end
      if Category > Num then Category = 1 end
      __u_, V = 0, 1
      moved = true
    end

  if V ~= 0 then
      local Num = table.getn(self.Dictionary[Category])
    __u_ = __u_ + V
      if __u_ < 1 then __u_ = Num end
      if __u_ > Num then __u_ = 1 end

      curp:td_u_ntan()
      curp:rt_Z_Ct_F(self.Dictionary[Category][__u_])

      curp.XinZ.End_Line = curp.rDrLine
      curp.XinZ.End_wP  = curp.rDrwP
      curp:G___u_ntan()
      moved = true
    end

    self:Flip()
  end
end
do
  local OSK = VP_xin_.new()
  local Notepad = _ERCn.new()
  local fba_chm = false
  VP_xin_:VP_xin_DAZCHd()
  System.currentDirectory("My Documents")

  while Notepad.blae do
    _j:G_()
  Notepad:Ma_Ha_j()

  if _j.adR and not _j.L and not OSK.hdd then OSK.ouh_ = not(OSK.ouh_) end
    if OSK.ouh_ then
      Notepad.StatesMsg[1] = "按Select选择中文输入或英文输入"
    if OSK.zkYm_C then Notepad.StatesMsg[2] = "拼音"
    elseif OSK.zkYm_yj then Notepad.StatesMsg[2] = "English"
     end
     local In = OSK:G_()
      local ScrwP_x, ScrwP_y = Notepad._ffM_s[Notepad.fbadhm].ScrwP_x,
                                 Notepad._ffM_s[Notepad.fbadhm].ScrwP_y
      if ScrwP_x > 320 and ScrwP_y > 170 then
    OSK:Ma_Ha_j(screen, 180, 187)
   else
        OSK:Ma_Ha_j(screen, 337, 187)
      end
      Notepad._ffM_s[Notepad.fbadhm]:dost(In)
    else
      Notepad.StatesMsg[2] = "Closed"
      Notepad.StatesMsg[1] = ""
      if not _j.L and _j.adRU then
        Notepad:tiq()
      end
    if _j.tST then Notepad:FileMenu() end
      if _j.RL and _j.adRD then
       Notepad:coty()
        Notepad._ffM_s[Notepad.fbadhm]:Load(Notepad.BaseDir .. "/My Documents/Readme.txt")
     end
   if _j.RR and _j.adRD then 
        if Notepad._ffM_s[Notepad.fbadhm].FileName then
        Notepad._ffM_s[Notepad.fbadhm]:Save(Notepad._ffM_s[Notepad.fbadhm].FileName)
        end
      end
   if _j.SL then
        local fbadhm_ = table.getn(Notepad._ffM_s)
        local H = _j:dDH_REZ()
        if H ~= 0 then
  fba_chm = true
          Notepad.fbadhm = Notepad.fbadhm + H
      if Notepad.fbadhm < 1 then Notepad.fbadhm = fbadhm_ end
          if Notepad.fbadhm > fbadhm_ then Notepad.fbadhm = 1 end
        end
      elseif _j.f_SL then
        if not fba_chm then Notepad:EditMenu() end
        fba_chm = false
      else
        Notepad._ffM_s[Notepad.fbadhm]:PR_TD_a()
      end
    end
    Notepad:Flip()
  end
end

while not _j.ST do
  _j:G_()
  screen:clear(_bw)
  LmGdG_:_in_oN(130, 130, "Quitting..Please Waiting..AAVV-Kyd")
  screen:flip()
  System.Quit()
end