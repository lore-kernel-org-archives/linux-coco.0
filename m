Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B0351C31
	for <linux-coco@lists.linux.dev>; Wed, 13 Dec 2023 17:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LejcMrHG"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-5c680110ea9so6300254a12.2
        for <linux-coco@lists.linux.dev>; Wed, 13 Dec 2023 09:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702488156; x=1703092956; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6ViX/Qqiqk/4TxTiVczHsfkpJiJjwcbO6aH0GOTDDcw=;
        b=LejcMrHGw+w3CUXoZPCEobzqPdXyASs9ROmHsut4xKVz2xt3s8bhKq5BTmoTH/NzoY
         jgLjpaWnkEZEK4obcvWSb8G+1nCHv0Czgbvs4jcBN9SFncz53WW9RkhRzoyJ9fPrXM3X
         Gx3LmUSpUuf1PRcG7PcSDNqb4WdK9PhMv0mkUpsMLR3XZjpv/PdGfimOnzMorwDUvWyA
         rLGcMVUR4sXKxrgfHl/Spx7dp6sZ1YUPj35/7k64liLwwpYDY2Vpfjy1wp7GmGXtEFO5
         3nlu5O+JoaBz0G1gkqDT5FLLfvwnNv0VOf6okViU4Mg8xRil3sR4UaDcwjLGa6y/Yt4j
         kfpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702488156; x=1703092956;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6ViX/Qqiqk/4TxTiVczHsfkpJiJjwcbO6aH0GOTDDcw=;
        b=Ojb1+JRHZLufXXt+idJRItpgcRF6X0Z0bjqFw0syV420iH5x2h17JhJyBCDzAR8LKl
         T/sJCHUUpdScNISHISMQlJKy8fLDt8xZYsWp4FHnHmhYjF+yXcjuZWzJesK5tDGqwe+9
         Owj3lffUtY3o/p0wGQememKY1bnMZAvTceD/jNEFwf5pxraukk829CE/TgHttHxG45Gp
         Lrho3QkgAT2LE14aSbn1TElKV7Ee+Z51y6AiVqYYNO/6RnDdRL4BZYf8r3A70kAJe4hd
         TIAjk4TmXYdkmc7zQ0w2Q0SvvKkxdJm2ggNl0z6tMC6n9z6MtI8xLohJyrxYj11eqCMk
         b7hg==
X-Gm-Message-State: AOJu0Yz5Moo1lcPeL/Qcl74atxrTboQ2knuEBn66vikOU4n+wlDrzkAr
	VxvV6MW5e7Bzt++caUATJ8UEYuaGyrA=
X-Google-Smtp-Source: AGHT+IHDC+0wF7yt+7K1uyt/r/lMDTjmVPeporp00WV6ZNCML8y1Mv3AsmJMG9SX/ub7Z9qJkWpnW9vU16Q=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a02:51e:b0:5ca:3b18:9ec6 with SMTP id
 bx30-20020a056a02051e00b005ca3b189ec6mr328107pgb.5.1702488156338; Wed, 13 Dec
 2023 09:22:36 -0800 (PST)
Date: Wed, 13 Dec 2023 09:22:34 -0800
In-Reply-To: <20231211231035.743cesujphsp5eve@box.shutemov.name>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231205004510.27164-1-kirill.shutemov@linux.intel.com>
 <20231205004510.27164-6-kirill.shutemov@linux.intel.com> <20231211231035.743cesujphsp5eve@box.shutemov.name>
Message-ID: <ZXnoWuaXvRkJjlDK@google.com>
Subject: Re: [PATCHv4 05/14] x86/kvm: Do not try to disable kvmclock if it was
 not enabled
From: Sean Christopherson <seanjc@google.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Elena Reshetova <elena.reshetova@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Kai Huang <kai.huang@intel.com>, Baoquan He <bhe@redhat.com>, 
	kexec@lists.infradead.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Wanpeng Li <wanpengli@tencent.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Dec 12, 2023, Kirill A. Shutemov wrote:
> On Tue, Dec 05, 2023 at 03:45:01AM +0300, Kirill A. Shutemov wrote:
> > kvm_guest_cpu_offline() tries to disable kvmclock regardless if it is
> > present in the VM. It leads to write to a MSR that doesn't exist on some
> > configurations, namely in TDX guest:
> > 
> > 	unchecked MSR access error: WRMSR to 0x12 (tried to write 0x0000000000000000)
> > 	at rIP: 0xffffffff8110687c (kvmclock_disable+0x1c/0x30)
> > 
> > kvmclock enabling is gated by CLOCKSOURCE and CLOCKSOURCE2 KVM paravirt
> > features.
> > 
> > Do not disable kvmclock if it was not enabled.
> > 
> > Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> > Fixes: c02027b5742b ("x86/kvm: Disable kvmclock on all CPUs on shutdown")
> > Reviewed-by: Sean Christopherson <seanjc@google.com>
> > Reviewed-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Cc: Wanpeng Li <wanpengli@tencent.com>
> 
> Paolo, Sean, any chance you can get it in through KVM tree while the rest
> of kexec patchset is pending? The problem is visible on normal reboot too.

Paolo is going to grab this (possibly for 6.7-rc?).  I'll keep this tagged on my
end in case that doesn't happen "soon".
