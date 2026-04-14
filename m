Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99383EAC77
	for <linux-coco@lists.linux.dev>; Tue, 14 Apr 2026 15:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776181746; cv=none; b=hJHKH3dD112uFPTaUiWMo/HrVEYGf8QJ7OZyYp6tnDPOrMQLf8jVITJZ0ZuKN0ORP4+WfR2y0X/0Ti48XQAgMtxDekHctRVKCBgxMhgh+iRM+mZ6ShPa2tui9aK1ce8BXOJ+bm8iUJIGBXmqOCEAHHRGKkILMMDGv5tYYc8kPO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776181746; c=relaxed/simple;
	bh=rxsydUejMarkrwk2AKdIKIxkz0zcXI9Bv6gWvm2199o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UtG68660pTdR6KvY6AzS+ZHLCAhBN+EC13dSUmqVrXDHzlaubEEYveVFLGX8gMh9nlBdJl2AeLGV1YRCRvd6+vz93OGQPH9vcHJtC4bNX5GIhQOLC/rgnfS0JoOStjqenUtXBHXyhd+1wwkU4fpIb4em5XBdMI+5HcihF2W1Ric=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WHyAbkke; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WHyAbkke"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-35e5791871fso5820999a91.3
        for <linux-coco@lists.linux.dev>; Tue, 14 Apr 2026 08:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776181745; x=1776786545; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h84POdD1fK3F4sl6KYnP0DuC/1y1hwWZ8DgthysiBOo=;
        b=WHyAbkkeT3OcLd9dGG/e+omx5Af+Xb16VXk/sVGll8g84l4bMq+yY1nKHLYnzIupjp
         WH+tnVXKyFMV+lG2FvlesRHaBnoRFIR7BAx/miHM/+68Tf9uqwvsO8bd4OaK6+uUDcuX
         MGH753V7mrF1wM+OsMBWfw3B7Y4vIrAi8wZsJcDSMDKjC6+QjWr//hmNzCzodBI7U9sc
         p6+rsnzDpnmo5QpLi0ZdCiuqgznaZ0nH65E7xof2MsT8WX30iwiNxYA8jIHLSYyIdyek
         L/WZs+Piej94NGKu75KGqB8loMZO6FaPoUepwKT3XmOfr7x22mreMw8GXqjs6aOzMJu4
         fcbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776181745; x=1776786545;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h84POdD1fK3F4sl6KYnP0DuC/1y1hwWZ8DgthysiBOo=;
        b=dzTUPiONIQm8X4USkjUOatvyquPhaKxf0wz6VCJL6hfD0MKEVlFoucqPn9KiUX4UoC
         e6hp/7u+qfLjpwBKkmfQxweEGLBL5KzkhU2fWX288v/bKLqmXPWf7sTuDpIhZ3HH26NW
         l6QUTo/tXQpqJIcCeBot3K0V+75FyNx4kUgMXCQddk4Oh2xBtxesuERicY+GmHWuKL8Z
         2Z/ScfxVHz3D6cnu3Cr76qJZLMtmZk5Kf5MPUIUhv68Cq41LinVoc5tJHPjIQMCNMPVC
         TtPZ4jmBn1BW30KtNuAQS+UmInXDFK0Bc+iOXTR5ex39odRF58YO8KPrh0Io3mfBweWh
         9jjw==
X-Forwarded-Encrypted: i=1; AFNElJ9LZ4nuTZu8vxhaa8E4jKyZVxgiLnSVmwNKEOnStnwIScPWIYUQ/KnbK2Nzni14aQu+51jOkmn6dh2Z@lists.linux.dev
X-Gm-Message-State: AOJu0YwaszoSdAW0Uu1h5CowpBpicQXk68pTZ3qqMUKGIMoYNDC+itBD
	TplsHvAbeJtgHlMcExaX/r+NrM7LDmzP0K/L+YrYf7qzZgh2kCmk/uMM3o3I+yi5eCAauro7qq/
	e+XoK8g==
X-Received: from pjsv9.prod.google.com ([2002:a17:90a:6349:b0:35c:101b:e59e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d410:b0:35f:b784:d3bf
 with SMTP id 98e67ed59e1d1-35fb784ddb9mr7468639a91.1.1776181744906; Tue, 14
 Apr 2026 08:49:04 -0700 (PDT)
Date: Tue, 14 Apr 2026 08:48:54 -0700
In-Reply-To: <d6f05e5fa781ccb465d27a4fb1c7c1ac1e9e95ff.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260409224236.2021562-1-seanjc@google.com> <20260409224236.2021562-6-seanjc@google.com>
 <e6e82905e6b9b1637ccb640097e67d21793f5895.camel@intel.com>
 <ad0DrDUsUKTMfrDW@google.com> <d6f05e5fa781ccb465d27a4fb1c7c1ac1e9e95ff.camel@intel.com>
Message-ID: <ad5h5hO7_QmJlOVk@google.com>
Subject: Re: [PATCH v2 5/6] KVM: x86: Track available/dirty register masks as
 "unsigned long" values
From: Sean Christopherson <seanjc@google.com>
To: Kai Huang <kai.huang@intel.com>
Cc: Chang Seok Bae <chang.seok.bae@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "kas@kernel.org" <kas@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026, Kai Huang wrote:
> On Mon, 2026-04-13 at 07:54 -0700, Sean Christopherson wrote:
> > More importantly, because the TDX-Module *requires* RCX (the GPR that h=
olds the
> > mask of registers to expose to the VMM) to be hidden on TDVMCALL, KVM *=
can't*
> > do any kind of meaningful "available" tracking. =C2=A0
> >=20
>=20
> Hmm I think RCX conveys the shared GPRs and VMM can read.  Per "Table 5.3=
23:
> TDH.VP.ENTER Output Operands Format #5 Definition: On TDCALL(TDG.VP.VMCAL=
L)
> Following a TD Entry":
>=20
>   RCX   ...
> 	Bit(s) Name         Description
>=20
> 	31:0   PARAMS_MASK  Value as passed into TDCALL(TDG.VP.VMCALL) by
> 			    the guest TD: indicates which part of the guest
> 			    TD GPR and XMM state is passed as-is to the
> VMM=C2=A0
> 			    and back. For details, see the description of
> 			    TDG.VP.VMCALL in 5.5.26.

The problem is that bit 1 in RCX is required to be '0'.  I.e. the guest *ca=
n't*
expose RCX to the VMM.  From the spec:

  15:0    GPR Mask Controls the transfer of GPR values:
  Bit 0:  RAX (must be 0)
  Bit 1:  RCX (must be 0)

And the code:

  api_error_type tdg_vp_vmcall(uint64_t controller_value)
  {
    api_error_type retval =3D TDX_OPERAND_INVALID;
    tdx_module_local_t* tdx_local_data_ptr =3D get_local_data();

    tdvmcall_control_t control =3D { .raw =3D controller_value };

    // Bits 0, 1 and 4 and 63:32 of RCX must be 0
    if (((control.gpr_select & (uint16_t)(BIT(0) | BIT(1) | BIT(4))) !=3D 0=
) ||  <=3D=3D=3D=3D sadness
         (control.reserved !=3D 0))
    {
        retval =3D api_error_with_operand_id(TDX_OPERAND_INVALID, OPERAND_I=
D_RCX);
        TDX_ERROR("Unsupported bits in GPR_SELECT field =3D 0x%x\n", contro=
l.gpr_select)
        goto EXIT_FAILURE;
    }

Oh, dagnabbit.  The spec also says:

  The value of RCX itself is always passed to the host VMM.

and then in code:

    td_exit_qual.gpr_select =3D control.gpr_select;
    td_exit_qual.xmm_select =3D control.xmm_select;

    tdx_local_data_ptr->vmm_regs.rcx =3D td_exit_qual.raw;

    // RAX is not copied, RCX filled above, start from RDX

I don't get why TDX requires bit 1 to be 0, but whatever.

So I was wrong, KVM can (and should!) validate the registers coming from th=
e
guest.  If we want to harden TDX, that's the obvious first step.
