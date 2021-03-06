% FUNCTION ne_surfmontage_closeui: close Surface montage UI
function ne_surfmontage_closeui(varargin)

% Version:  v1.0
% Build:    15010816
% Date:     Jan-08 2015, 4:00 PM EST
% Author:   Jochen Weber, SCAN Unit, Columbia University, NYC, NY, USA
% URL/Info: http://neuroelf.net/

% Copyright (c) 2015, Jochen Weber
% All rights reserved.
%
% Redistribution and use in source and binary forms, with or without
% modification, are permitted provided that the following conditions are met:
%     * Redistributions of source code must retain the above copyright
%       notice, this list of conditions and the following disclaimer.
%     * Redistributions in binary form must reproduce the above copyright
%       notice, this list of conditions and the following disclaimer in the
%       documentation and/or other materials provided with the distribution.
%     * Neither the name of Columbia University nor the
%       names of its contributors may be used to endorse or promote products
%       derived from this software without specific prior written permission.
%
% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
% ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
% WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
% DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY
% DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
% (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
% LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
% ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
% (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
% SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

% global variable
global ne_gcfg;

% try to store last known position
try
    cc = ne_gcfg.fcfg.SurfMontage;
    ne_gcfg.c.ini.Children.SurfMontagePosition = ...
        ne_gcfg.h.SurfMontage.SMFig.Position(1:2);
    ne_gcfg.c.ini.SurfMontage = cc.mc;
    ne_gcfg.c.ini.SurfMontageConfigs = cc.cc;
    ne_gcfg.c.ini.SurfMontageElems = cc.ec;
catch ne_eo;
    ne_gcfg.c.lasterr = ne_eo;
end

% try to close window
try
    ne_gcfg.h.SurfMontage.SMFig.Delete;
catch ne_eo;
    ne_gcfg.c.lasterr = ne_eo;
end

% remove struct
ne_gcfg.fcfg.SurfMontage = [];
ne_gcfg.h.SurfMontage = [];
