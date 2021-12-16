Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFF529CA
	for <linux-coco@lists.linux.dev>; Thu, 16 Dec 2021 23:39:40 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id b22so1032082lfb.9
        for <linux-coco@lists.linux.dev>; Thu, 16 Dec 2021 15:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m/LjgsVegt/HRyKkkM2n6c0UK9wyNwAZfK1yqCRibBE=;
        b=ZjNYT24fop4NBsOLESN28pcPFI76P21GY15lEKVa1tKR8Y6MixFR71XXHM7GhfF9Om
         Mic+/EDIsAL+Oy0aBQJNKwWOjgm51UPxF4cZ/YnojHbYK5t7OKs/w0RJ0fMV/Jty5UP3
         GD7cR728r/nXnJAOmo8UvAJPlaoac5Lt5ox6J43oGgiSlI+tzAmdbkGHwKtBLR6b03CD
         7oHTeGaKYJVODZhzKZPRa/GHySInjAASy4QEqvKVn6IABK89mCJ8zObuLFxxpFd4M9oY
         nNbcSS9gTr2YJoL93pnZ4nD3gzT76+OThD67D+uVZQJZKT64KbSwJ1kM4lJaQvROfOCD
         Mpsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m/LjgsVegt/HRyKkkM2n6c0UK9wyNwAZfK1yqCRibBE=;
        b=dXthe1J2Aj3rO5sAQDVtLUoopEoxAGN5n8JX5j/Y7YThTghuO+Os7y3tURZ1jZSqnC
         8j4cCAQ7Xc+omkuBEA18bTImODS68FKgPQ5OO7/vlHihuMZmfLuvyjmhY8+wV+SCUj1W
         +xt4WKVL8OmWSFcHVpfaGbktd/AXEk1mra3BO0UbEDmMcUhe+QfeaBR1XB7whG76lV4g
         4Yr97PjQ+Lt0j4GUaBfRr3/yYZ6IlKRNMf1Xo9P5+bbBaOF+tNvohrwgMHkSLuDPCKF2
         lAtkG7dTQtjSFcbX+d3+QijScNWOrkBdw8aoc603dawtraYl3VTPsdqg3Dy1DuNM4bPq
         pPVA==
X-Gm-Message-State: AOAM530Jc50pYZIOVOeYdp1KMpXKkMkwDGr2/MxViU3g2WcTChEuk9Jg
	NhH9uATA/gHIK3FL1vWMlOXPB7XazakQEah3jA7jVQ==
X-Google-Smtp-Source: ABdhPJzJ3Ag+Yv1KTmSJebYEdW20IHyaYIzqo6gVs4G5mbbZ7dHZUudFFNmxFE9zK8L0+gvaxQYp82IZFk5AQAuq/rc=
X-Received: by 2002:a05:6512:1324:: with SMTP id x36mr432363lfu.495.1639697978059;
 Thu, 16 Dec 2021 15:39:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211210154332.11526-1-brijesh.singh@amd.com> <20211210154332.11526-9-brijesh.singh@amd.com>
 <YbugbgXhApv9ECM2@dt>
In-Reply-To: <YbugbgXhApv9ECM2@dt>
From: Mikolaj Lisik <lisik@google.com>
Date: Thu, 16 Dec 2021 15:39:26 -0800
Message-ID: <CADtC8PX_bEk3rQR1sonbp-rX7rAG4fdbM41r3YLhfj3qWvqJrw@mail.gmail.com>
Subject: Re: [PATCH v8 08/40] x86/sev: Check the vmpl level
To: Venu Busireddy <venu.busireddy@oracle.com>
Cc: Brijesh Singh <brijesh.singh@amd.com>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, linux-efi@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-mm@kvack.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Joerg Roedel <jroedel@suse.de>, Tom Lendacky <Thomas.Lendacky@amd.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Jim Mattson <jmattson@google.com>, Andy Lutomirski <luto@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Sergio Lopez <slp@redhat.com>, 
	Peter Gonda <pgonda@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, David Rientjes <rientjes@google.com>, 
	Dov Murik <dovmurik@linux.ibm.com>, Tobin Feldman-Fitzthum <tobin@ibm.com>, Borislav Petkov <bp@alien8.de>, 
	Michael Roth <michael.roth@amd.com>, Vlastimil Babka <vbabka@suse.cz>, 
	"Kirill A . Shutemov" <kirill@shutemov.name>, Andi Kleen <ak@linux.intel.com>, 
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>, tony.luck@intel.com, marcorr@google.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 16, 2021 at 12:24 PM Venu Busireddy
<venu.busireddy@oracle.com> wrote:
>
> On 2021-12-10 09:43:00 -0600, Brijesh Singh wrote:
> > Virtual Machine Privilege Level (VMPL) feature in the SEV-SNP architecture
> > allows a guest VM to divide its address space into four levels. The level
> > can be used to provide the hardware isolated abstraction layers with a VM.
> > The VMPL0 is the highest privilege, and VMPL3 is the least privilege.
> > Certain operations must be done by the VMPL0 software, such as:
> >
> > * Validate or invalidate memory range (PVALIDATE instruction)
> > * Allocate VMSA page (RMPADJUST instruction when VMSA=1)
> >
> > The initial SEV-SNP support requires that the guest kernel is running on
> > VMPL0. Add a check to make sure that kernel is running at VMPL0 before
> > continuing the boot. There is no easy method to query the current VMPL
> > level, so use the RMPADJUST instruction to determine whether the guest is
> > running at the VMPL0.
> >
> > Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> > ---
> >  arch/x86/boot/compressed/sev.c    | 34 ++++++++++++++++++++++++++++---
> >  arch/x86/include/asm/sev-common.h |  1 +
> >  arch/x86/include/asm/sev.h        | 16 +++++++++++++++
> >  3 files changed, 48 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/x86/boot/compressed/sev.c b/arch/x86/boot/compressed/sev.c
> > index a0708f359a46..9be369f72299 100644
> > --- a/arch/x86/boot/compressed/sev.c
> > +++ b/arch/x86/boot/compressed/sev.c
> > @@ -212,6 +212,31 @@ static inline u64 rd_sev_status_msr(void)
> >       return ((high << 32) | low);
> >  }
> >
> > +static void enforce_vmpl0(void)
> > +{
> > +     u64 attrs;
> > +     int err;
> > +
> > +     /*
> > +      * There is no straightforward way to query the current VMPL level. The
> > +      * simplest method is to use the RMPADJUST instruction to change a page
> > +      * permission to a VMPL level-1, and if the guest kernel is launched at
> > +      * a level <= 1, then RMPADJUST instruction will return an error.
>
> Perhaps a nit. When you say "level <= 1", do you mean a level lower than or
> equal to 1 semantically, or numerically?
>

+1 to this. Additionally I found the "level-1" confusing which I
interpreted as "level minus one".

Perhaps phrasing it as "level one", or "level=1" would be more explicit?
