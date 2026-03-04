Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F356417C203
	for <linux-coco@lists.linux.dev>; Wed,  4 Mar 2026 00:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772582807; cv=pass; b=I5yq3Rt78u8xhuTmjpB30g9ZX+zVaRjNsxTTeYIuikMC89nw71OinB4nSKgA5evQw9f1oRpgutYSQlW2POx20AiMDPTBCNcYLeRwGBlRnNWQw3S4oKOB79Pp7kuL216XVy/MFDpYFYPDvUgYMxTJOSN4xf5vwjHFFOxgPYOHBOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772582807; c=relaxed/simple;
	bh=SE0iuTKzP7Mva7jgcYokHYOcLSARQ9ahmEoA1aPrACI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GNWnhXVdt/f4Ypva6/WQZD2I1QQ0NdkBVdtnYUtyxwh+2ryqsiZSQRNNTrX/V4Owck5fjtLelp1qeF7qkfU+6vxXqJnMOlOjKjM90CDCvpxMRpA/UteLe30Nfyy+LqK8BTZKDDV0cdLp+svVmfFbz135qI6e6gjgzvCUiXJ5VFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZfTwrPhg; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZfTwrPhg"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-505d3baf1a7so739501cf.1
        for <linux-coco@lists.linux.dev>; Tue, 03 Mar 2026 16:06:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772582800; cv=none;
        d=google.com; s=arc-20240605;
        b=YrMpYVjoBkMfe3iyOYlApyVSZ/wc4JoFYMB1fMVoWZ19T8J9gLaVqwX61OEHsKIC/j
         RLqXsbOe1oiwdUfJdBkepiY/SPI/lnwwdQv4+uHyoautvuvEe+ge0piLkrfDjPbUmWGW
         33j9o8PRXsQ6ETCXywwcsPTHp9MqZUhYDG1cOpBiqboCHZy6Oo3H9VzqBWUooRNc33Nc
         awPxg9QM6mV+Pf2dRmzxni5nRoH1O723x51H1iRDwGgET9D568BjJjZx6gv0zbTLP+pE
         dSXs2mK5QZly7SAtgkYmXQgOsyJUNIq0fhy3WGTxzKDxi/Y85+QqhnxUp5urUiQ8Vy/6
         seLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y/PStokD6IlhvxuuSo1FJomzpaCmyss/AOhqDAfuiyc=;
        fh=O3dTDduEcarvCub8ioeHuFYVcmheW+StuXblYOw6/Bc=;
        b=UDeldhXZDHJiK/QFvweSJHIdBTAnBs0JSk602y7e/2GYP17Beno7vwQbrSsVMfwmEl
         TvaNyl71VyI/RUTyM/xUp9ugfidxdtfm9TJnGO/2a0wo2bg7ph434ZjJU8LMj0634+Ok
         xiVFYbcCYPCVnGEHeJttbDpFc/RxXDX+JOgzD/RbdE+BlK9/0Cv987P4cXpT7gga5XCr
         MhOtqdG6sZedxzzAm0Of+YJzn8pxGRZOXvhOKA76xhItFnT6LZc/T+3COIgFafjrawrW
         Ymdifw3Sv4r7gi4E05P5OhMGPGGjSI02CglsYwcqA5Nrw0z7vI5In3KxklQOXSHfml81
         NLfA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772582800; x=1773187600; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/PStokD6IlhvxuuSo1FJomzpaCmyss/AOhqDAfuiyc=;
        b=ZfTwrPhgnOF8Zwt2aK8SKWMsHUWBmgoQ2MvvTEh0igNd5QMGIgYdMZ+xteR+RnXbqe
         mtjlQVoOME9f0CnKrUVHQpC2vUGA6/UvxIfsnoPSGjZpEla8hp5gaOn1nhVfmOfPcaIH
         ehstpQhGBBWUcnZnRJVyjnGCqFxfUwOysTta/zvXNyFK7v7YN21Wn+nTPIettZo8GMuQ
         ULT52ZB4AZG7Kt6bOkwjVzE+XVg7Pi/lLsx8wBMHB7CIuR6ZXOTEwwhm7VpeB727Abm6
         /Jg4BE84rjGa/rqQ+SAXiatLDNLNowUPj1czUOwepSeHAkeOGbEgb8mNu7zu+yUmVENu
         /aGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772582800; x=1773187600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y/PStokD6IlhvxuuSo1FJomzpaCmyss/AOhqDAfuiyc=;
        b=WtteCUZU/X7/hFHK0IvPPbqfGtNIxRlE/UNf1JEH/l7+xbKIPreUGAYaAJ6EdFWvhw
         4ND7Knv8POcHHzq4MpbC5QKkOph3pahzarV2DubuOmLPWm/irz3fkBBgB3fFB0XyNc8v
         D70IntSnCYlogxkNDu5DU2GWH2EVnfikW0A3hf4+RAF5gcd/eg4yYuWohZ8qpTRmfZbx
         MqkY9EA4hc0n6ZWQyOwO7/5hQvU195rQhoR+MvcyGvEkk9T/9OBnRH47xp3xV4Zp/u+p
         arAR+ekGZDKCaZf+cvJ3QBedB8G8SePlzDQee2DdQMT7TkxzDg0jopt5bzmrUx8t428S
         xtlA==
X-Forwarded-Encrypted: i=1; AJvYcCXfN0sNJeJI5dBknEQX6qQhSTL8VpPbQWkvfJbwIeEN4AFCGDXl65ua07DX2kUok2hACt/kFy1/9WuZ@lists.linux.dev
X-Gm-Message-State: AOJu0YytuHtcm9xq0nOpecRh53pa0qRqt1ZY77LkehKZI9Evvfktfgzw
	xkBIY+PXfSG6DtOLB6x1d+sQyjCdP9Vukzb/j/NN96qOy5pJiY7wP7uyOuelG5RaKfbvIcqqRYc
	fRn7S7Ostc6B+O8xCV8KXCyPWfsPGC96GljB4i3dS
X-Gm-Gg: ATEYQzwgzSu5O8y4SarTL+OtIlYnE4LjRygbkoA5LG7qIgTdIuwNRSXSSdrHbp+ussE
	qyGLacCqEpcg5v3u/j4bN2h/j92CR6Zew5w1yNBsEGzGZxKdr8fNPy/CME8yTB7SNSwDXrzuZcO
	U7lnT9A9tn/K9WJprFR1fSLFk2UHKoS0YkqWVPsE5zLnylqmGtNIvB15rbYNzCV8EPiKmALv+2E
	j9IoI9tU4bLobiFLSUKgOdvgp+ud7RTqVVxVIlW7n4mA4PGKZZOkcBPlc2qfEhzy8FgAiSFticp
	GVi/wZN5poHDZC58UmHvVIyjehTQfKNp5gGpp/xY
X-Received: by 2002:ac8:7f07:0:b0:503:4bc:c925 with SMTP id
 d75a77b69052e-5076186631dmr41314681cf.13.1772582799147; Tue, 03 Mar 2026
 16:06:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260214012702.2368778-1-seanjc@google.com> <CAAhR5DF5BAcFO2tj0H63ZoRCcdpDS4Jw9XzqC=L2xWMW0M=0QQ@mail.gmail.com>
In-Reply-To: <CAAhR5DF5BAcFO2tj0H63ZoRCcdpDS4Jw9XzqC=L2xWMW0M=0QQ@mail.gmail.com>
From: Sagi Shahar <sagis@google.com>
Date: Tue, 3 Mar 2026 18:06:27 -0600
X-Gm-Features: AaiRm51ACYQne9diQMSqsETp8etVEqCczz3Uj5tSioGxwFV-IALILtfuhbSZAbg
Message-ID: <CAAhR5DFVmu5dViPBuwd_nSu_Z4=jL5W83q=sRkNP2bOqW-5_NA@mail.gmail.com>
Subject: Re: [PATCH v3 00/16] KVM: x86/tdx: Have TDX handle VMXON during bringup
To: Sean Christopherson <seanjc@google.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Chao Gao <chao.gao@intel.com>, 
	Xu Yilun <yilun.xu@linux.intel.com>, Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026 at 3:39=E2=80=AFPM Sagi Shahar <sagis@google.com> wrote=
:
>
> On Fri, Feb 13, 2026 at 7:27=E2=80=AFPM Sean Christopherson <seanjc@googl=
e.com> wrote:
> >
> > Assuming I didn't break anything between v2 and v3, I think this is rea=
dy to
> > rip.  Given the scope of the KVM changes, and that they extend outside =
of x86,
> > my preference is to take this through the KVM tree.  But a stable topic=
 branch
> > in tip would work too, though I think we'd want it sooner than later so=
 that
> > it can be used as a base.
> >
> > Chao, I deliberately omitted your Tested-by, as I shuffled things aroun=
d enough
> > while splitting up the main patch that I'm not 100% positive I didn't r=
egress
> > anything relative to v2.
>
> Tested running TDs and TDX module update using "Runtime TDX Module
> update support" patches [1]
> Tested-by: Sagi Shahar <sagishah@gmail.com>
>
> [1] https://lore.kernel.org/lkml/20260123145645.90444-1-chao.gao@intel.co=
m/

Actually, looking at the "Runtime TDX Module update support" patches I
don't think I ran those with this version of the patches since the
"tdx_module_status" changes are incompatible. So it was just the
patches in this patchset.
