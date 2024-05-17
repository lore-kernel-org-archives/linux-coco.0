Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71DB27471
	for <linux-coco@lists.linux.dev>; Fri, 17 May 2024 16:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715962370; cv=none; b=TqEzWoG+bdfUnNTlYZsPlq59QOiKH5/r0G1pPR7cmIk6X/hEBs/6Fm+sTo53IOrdrZdlm+x5yiNw4qVpEVJk9mF/zJBxxns7nawK94h2k3rVRlk4IOjTAqzy6+TeKRBc6hAKWqefL+qHQZB3ik/3HLpo4VKKR6aN+8Pq6dEMjok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715962370; c=relaxed/simple;
	bh=5gUro8GtU38iMRW0NhHxIp0qvlICZpEYq2lzerfQgvY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=I5Uy7P/JyjT7KOJFKONxMyj+y833Qp/CfDpXBQEXsWQrHCoVWgkGxMAb317TQZFe02Pb5izLvpbp1XB/cOdxp7NlmpfZ4+aQ/Ge8yn9Fwtz8XbTjAFak1bqJs6QWxT2huLNcSTREyfOkkX/hcMa0e33dRtMDWO40qTRHbTtSltw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NY1uDKPg; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NY1uDKPg"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-61be8f9ca09so159367177b3.2
        for <linux-coco@lists.linux.dev>; Fri, 17 May 2024 09:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715962368; x=1716567168; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PBMN//2dzEWEm4W8Y5IMMq8lUa+WFPysYoXE9Qr+u4k=;
        b=NY1uDKPg9WUb1ofGr5s6G3d33ULWrkg6edDZn3nKhNt3i5rbElTltA+FHB+cMZdQ01
         ucP2qefGRMD/9lEH/mdhIbY43STVGtvMHm0MOBzL7yGYo1Y8x4p8PDYi/WMF8GEzaTro
         E0irfjeXjKn5U1UC+AHb2Gx4Pok9VBC6JdmnEvb8r6nP9yp242BHlq6nveOTUwhSE1O1
         Eyti5TvlDTRauJ+AIejtNqr95gIevBAA2j+4m78iJywjwMy26Pj0WnW11cgG3CVtm4xU
         OZHxsfL+qrT/6zZ494NgoFtBunyvoVVwJiOYSj1zrlCV9RX8UTQMO2yfItU3Zi9vGK3q
         GnKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715962368; x=1716567168;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PBMN//2dzEWEm4W8Y5IMMq8lUa+WFPysYoXE9Qr+u4k=;
        b=MpTJ+S03PT+/BFBCZ7T8XbTypXQpF+Tu8pVsiB3LIKZRQbWenkAA847Fzhj57cKYSd
         YT4hO5xq6iTGNOzyKDbIlKwj+ZXIMdjz4PEOLyY06kYoL2xz9nPleEVIZWNF2Iz3dZSs
         YPGY9LVMNGRIHqZDZIOWg3wkJ91vbN9WSrpBD0GRyVKRRjrdVkfZKxv83XB0/hOQOldQ
         F0C1J/F/nGIVpNf3n0ukfg6jkkpakVFGrA+OV39dZ7TvB0PB9zeeLXMpRh1HHkZnNNTY
         nu8glG2L2wgGS2mIBXHBZdIHWAnHvTOgU368b8CcBoKlYzQZH1hDor9nnANmGjfHJFky
         WVjQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7XRzSv2Dtb3R++6DZSRMBSM5IEglUgEomiJGeSKSKv75Bhxsuls7V81XkiS8QoFfq4JTecBBbxd2Aljb8dCzXLnFGpAOlW0keIw==
X-Gm-Message-State: AOJu0YwHL2xJxYhU+2JZR57ZlUNyWsOSL/Zkh7eKtvxMM/+5+Ue233JV
	ovvtZT1HguXrMGh92DtjxUUVBwr1eKn0Y1YKDXrUm2Q0VkURAEtFQLPqLSt67UF4iGEGmyfpLKM
	7cg==
X-Google-Smtp-Source: AGHT+IFGzT5q2OH0P9CSzr9yrlMaLLENCNJTcHeltFHb1x5Oic5rCqblZN8M4A5Jxpu3AVVBsEkP+Rz2V2c=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:338f:b0:61b:ec62:e713 with SMTP id
 00721157ae682-622b019b498mr55037307b3.10.1715962367828; Fri, 17 May 2024
 09:12:47 -0700 (PDT)
Date: Fri, 17 May 2024 09:12:45 -0700
In-Reply-To: <ohvjbokpaxagc26kxmlrujab7cw3bekgi5ln7dt46cbsaxcqqh@crvqeohfazmf>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240517121450.20420-1-jgross@suse.com> <ohvjbokpaxagc26kxmlrujab7cw3bekgi5ln7dt46cbsaxcqqh@crvqeohfazmf>
Message-ID: <Zkd28IN8KvyD4GIX@google.com>
Subject: Re: [PATCH] x86/kvm/tdx: Save %rbp in TDX_MODULE_CALL
From: Sean Christopherson <seanjc@google.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	linux-coco@lists.linux.dev, Dave Hansen <dave.hansen@linux.intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	"H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, May 17, 2024, Kirill A. Shutemov wrote:
> On Fri, May 17, 2024 at 02:14:50PM +0200, Juergen Gross wrote:
> > While testing TDX host support patches, a crash of the host has been
> > observed a few instructions after doing a seamcall. Reason was a
> > clobbered %rbp (set to 0), which occurred in spite of the TDX module
> > offering the feature NOT to modify %rbp across TDX module calls.
> > 
> > In order not having to build the host kernel with CONFIG_FRAME_POINTER,
> > save %rbp across a seamcall/tdcall.
> 
> There's a feature in TDX module 1.5 that prevents RBP modification across
> TDH.VP.ENTER SEAMCALL. See NO_RBP_MOD in TDX Module 1.5 ABI spec.

LOL, "feature".  How was clobbering RBP not treated as a bug?  I'm party joking,
but also quite serious.  Unless I'm missing something, the guest ABI changes
based on whether or not NO_RBP_MOD is enabled, as a TDVMCALL that was previously
valid would now fail if the guest attempts to expose RBP to the host.

The whole point of Intel defining a guest-host ABI is to allow interoperability
between hypervisors and guests.  Allowing the hypervisor to arbitrarily change the
ABI is asinine.

> I think it has to be enabled for all TDs and TDX modules that don't
> support it need to be rejected.

Yes, because as above, IIUC it's a breaking change for the guest ABI.
