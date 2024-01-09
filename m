Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705EC39AE3
	for <linux-coco@lists.linux.dev>; Tue,  9 Jan 2024 14:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fonp6woV"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-5e9de9795dfso54312797b3.0
        for <linux-coco@lists.linux.dev>; Tue, 09 Jan 2024 06:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1704812358; x=1705417158; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qRUOJmFKmeM5oqO379Ob7Dp8PcHF+ZNO7Gp6RMyYig4=;
        b=fonp6woVyvq7AhUwcAxOuVRRK0QU2w6wP5ZsEBq/UJLnsPk23n2mnrxEIzxuH7ZX4j
         lXAo5stOOfIOI/Avmz7sMdwWXjgxC3DA1zr+J1UYgCKV1z2Ye+NpghVQJ2Yv4B8HMlti
         G4LoOvGSuo4jHjlqkXlWe166EJsRRTI0UQg1vufMK2eAWa0ZNLprOcpYZ/xML4No4fBB
         Y+UMPTUtNAaYMT2QhA8lev68LERK0SIrUmx5DPZyRzIwO1HzhC/9iVwicE5pmRdCOPEe
         mz3KMUa3FO6iI6VI0dE1O36yfZn30RYePPb5Rdz5t0qYzCUjxSi5aQXrNYKEl35pbYRu
         3gjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704812358; x=1705417158;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qRUOJmFKmeM5oqO379Ob7Dp8PcHF+ZNO7Gp6RMyYig4=;
        b=Mklpkl83CDq2AHStlCKzCSQ89H4dwidzAwx1TFoKvMTw5IPwD6LdWfW6O0GLt9kEY8
         Q/0+dbh9ibpHWyiXTQnIQBRivl8Pdsozy+B29/YX91N7IOWtg6DTcvx7T7++9SMEOUxI
         WSG2D92cg7ZPG5amPsZHRSrcBfLq+j27xym8JGeg5rTvypdMlywPCmqtgogePf9qRg3i
         V9T9Yo2GWKBYmY4cpmDvjKgYHg7heiVL7ifW+bZWdVKCe5256U3mb7CnE5vas7GaiuVu
         qI4SXmVboSLw2YL6asbk/zjGDbkbpO87MYBn/cL/RNcLS3LIBz0l/LqE32CyACJPbojg
         g1XA==
X-Gm-Message-State: AOJu0Yyr7gPDBZS5Ft0w3XccmUk0bscvC0NaoRHV6Rq8QnOdBlnUkuwx
	beAYQT+NcnbHNMbI26KbCAOkuOnMspr9OwopDQ==
X-Google-Smtp-Source: AGHT+IGyHuCu911KvlgqonOQL2XqK0U7rft8u026+64TBKlTyRqGPxisRKRQIhISiOb7Znai4/AbV5q5Ek4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:548:b0:db5:3676:74dd with SMTP id
 z8-20020a056902054800b00db5367674ddmr2055224ybs.3.1704812358274; Tue, 09 Jan
 2024 06:59:18 -0800 (PST)
Date: Tue, 9 Jan 2024 06:59:16 -0800
In-Reply-To: <20240104150526.52vbu4gownp7jm3i@box.shutemov.name>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231205004510.27164-1-kirill.shutemov@linux.intel.com>
 <20231205004510.27164-6-kirill.shutemov@linux.intel.com> <20231211231035.743cesujphsp5eve@box.shutemov.name>
 <ZXnoWuaXvRkJjlDK@google.com> <20240104150526.52vbu4gownp7jm3i@box.shutemov.name>
Message-ID: <ZZ1fRP434gsSKtcn@google.com>
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

On Thu, Jan 04, 2024, Kirill A. Shutemov wrote:
> On Wed, Dec 13, 2023 at 09:22:34AM -0800, Sean Christopherson wrote:
> > On Tue, Dec 12, 2023, Kirill A. Shutemov wrote:
> > > On Tue, Dec 05, 2023 at 03:45:01AM +0300, Kirill A. Shutemov wrote:
> > > > kvm_guest_cpu_offline() tries to disable kvmclock regardless if it is
> > > > present in the VM. It leads to write to a MSR that doesn't exist on some
> > > > configurations, namely in TDX guest:
> > > > 
> > > > 	unchecked MSR access error: WRMSR to 0x12 (tried to write 0x0000000000000000)
> > > > 	at rIP: 0xffffffff8110687c (kvmclock_disable+0x1c/0x30)
> > > > 
> > > > kvmclock enabling is gated by CLOCKSOURCE and CLOCKSOURCE2 KVM paravirt
> > > > features.
> > > > 
> > > > Do not disable kvmclock if it was not enabled.
> > > > 
> > > > Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> > > > Fixes: c02027b5742b ("x86/kvm: Disable kvmclock on all CPUs on shutdown")
> > > > Reviewed-by: Sean Christopherson <seanjc@google.com>
> > > > Reviewed-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> > > > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > > > Cc: Wanpeng Li <wanpengli@tencent.com>
> > > 
> > > Paolo, Sean, any chance you can get it in through KVM tree while the rest
> > > of kexec patchset is pending? The problem is visible on normal reboot too.
> > 
> > Paolo is going to grab this (possibly for 6.7-rc?).  I'll keep this tagged on my
> > end in case that doesn't happen "soon".
> 
> Sean, any update on this?

'Tis now in kvm/next, commit 1c6d984f523f ("x86/kvm: Do not try to disable kvmclock
if it was not enabled").  The one time procrastinating on responding actually worked. ;-)
