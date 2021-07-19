Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11469173
	for <linux-coco@lists.linux.dev>; Mon, 19 Jul 2021 17:18:37 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id b12so17068040pfv.6
        for <linux-coco@lists.linux.dev>; Mon, 19 Jul 2021 10:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Watgo1ybuVmA6y/DrRzi5+dx21PvaWB/uBndaAl0SS4=;
        b=oCgIveufWJo78leCKxNHNdT0SARRh3FWP7aybu743zIm31cBc+7B6SDrREeewdKMu0
         WK8025dOapp+KTQnic/FqQx3BJPDTVKgKN4R/nAP1FfE+9IVa1JsTI6XcqeFXLTXkrub
         pK47v2RnQhmDFRweGxQ08Eu2uN6icbJSi+79M9iV7yDiDUo5BfcPGBPfvF1PWXr3DElx
         +iPdsV4Dheg/zuh9lxfH6daw97lFZfTSJR+G5k9ogbLlO7ybM5nyLBfXjiuMcQPhqG7Y
         5jSPI3VKBNZW7RUu9i990b22uE/YYqoYRbJOvdhR2U1l3xURwRf9s/5VV9tO/E9ww9M1
         blYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Watgo1ybuVmA6y/DrRzi5+dx21PvaWB/uBndaAl0SS4=;
        b=iHvqlBWxHNwIMJ5HoIa1C/H9tWIK88ShmdApU1Psna3c5PKmrahoQidFkDieA9HBJE
         DhDLad2bDMSqS4X10Jhw92tS/I/HAW9upzAEQqJm49Lk+WIqqEnP0vlUDKKOXvvv5LbZ
         ToOpC9V8H+i05f1DMOOyOhRWrj4Y9NVc2K+xyYyRciGggAFViDQtFj6tq78TQAb0JkXQ
         5d9l5XF+IV7O73SgK+REwDRP/W+cKXqUvcWD0uDo88C3btsTe43rWa1B0X3qUjIkFnUJ
         YSBnj9EsEkXujRKPu8IebyKcentsi5Vr51s9qW7THcDWKMpICopP/m6yJ2WfxSiUKgMZ
         BO1A==
X-Gm-Message-State: AOAM530G3RgE125LM/QUsL/Pfmjv7Y6IbLcYWcXvO3b+WMdQgA1E27hn
	0b2Tq7dHMncG/0V27OxHwzptfw==
X-Google-Smtp-Source: ABdhPJyOBiASdK1PworiTDewkYK+q+KqQSKd5RlcoQ9d+PE/Jh2uzg1AmF2ErgsFE2d5KPOR3/ALxA==
X-Received: by 2002:a63:1f5c:: with SMTP id q28mr26144545pgm.114.1626715117362;
        Mon, 19 Jul 2021 10:18:37 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id e13sm21516384pfd.11.2021.07.19.10.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 10:18:37 -0700 (PDT)
Date: Mon, 19 Jul 2021 17:18:33 +0000
From: Sean Christopherson <seanjc@google.com>
To: Brijesh Singh <brijesh.singh@amd.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-mm@kvack.org,
	linux-crypto@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>,
	Andy Lutomirski <luto@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Sergio Lopez <slp@redhat.com>, Peter Gonda <pgonda@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Dov Murik <dovmurik@linux.ibm.com>,
	Tobin Feldman-Fitzthum <tobin@ibm.com>,
	Borislav Petkov <bp@alien8.de>, Michael Roth <michael.roth@amd.com>,
	Vlastimil Babka <vbabka@suse.cz>, tony.luck@intel.com,
	npmccallum@redhat.com, brijesh.ksingh@gmail.com
Subject: Re: [PATCH Part2 RFC v4 25/40] KVM: SVM: Reclaim the guest pages
 when SEV-SNP VM terminates
Message-ID: <YPWz6YwjDZcla5/+@google.com>
References: <20210707183616.5620-1-brijesh.singh@amd.com>
 <20210707183616.5620-26-brijesh.singh@amd.com>
 <YPHnb5pW9IoTcwWU@google.com>
 <2711d9f9-21a0-7baa-d0ff-2c0f69ca6949@amd.com>
 <YPIoaoDCjNVzn2ZM@google.com>
 <e1cc1e21-e7b7-5930-1c01-8f4bb6e43b3a@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1cc1e21-e7b7-5930-1c01-8f4bb6e43b3a@amd.com>

On Mon, Jul 19, 2021, Brijesh Singh wrote:
> 
> On 7/16/21 7:46 PM, Sean Christopherson wrote:
> 
> > takes the page size as a parameter even though it unconditionally zeros the page
> > size flag in the RMP entry for unassigned pages.
> >
> > A wrapper around rmpupdate() would definitely help, e.g. (though level might need
> > to be an "int" to avoid a bunch of casts).
> >
> >   int rmp_make_shared(u64 pfn, enum pg_level level);
> >
> > Wrappers for "private" and "firmware" would probably be helpful too.  And if you
> > do that, I think you can bury both "struct rmpupdate", rmpupdate(), and
> > X86_TO_RMP_PG_LEVEL() in arch/x86/kernel/sev.c.  snp_set_rmptable_state() might
> > need some refactoring to avoid three booleans, but I guess maybe that could be
> > an exception?  Not sure.  Anyways, was thinking something like:
> >
> >   int rmp_make_private(u64 pfn, u64 gpa, enum pg_level level, int asid);
> >   int rmp_make_firmware(u64 pfn);
> >
> > It would consolidate a bit of code, and more importantly it would give visual
> > cues to the reader, e.g. it's easy to overlook "val = {0}" meaning "make shared".
> 
> Okay, I will add helper to make things easier. One case where we will
> need to directly call the rmpupdate() is during the LAUNCH_UPDATE
> command. In that case the page is private and its immutable bit is also
> set. This is because the firmware makes change to the page, and we are
> required to set the immutable bit before the call.

Or do "int rmp_make_firmware(u64 pfn, bool immutable)"?

> > And one architectural question: what prevents a malicious VMM from punching a 4k
> > shared page into a 2mb private page?  E.g.
> >
> >   rmpupdate(1 << 20, [private, 2mb]);
> >   rmpupdate(1 << 20 + 4096, [shared, 4kb]);
> >
> > I don't see any checks in the pseudocode that will detect this, and presumably the
> > whole point of a 2mb private RMP entry is to not have to go walk the individual
> > 4kb entries on a private access.
> 
> I believe pseudo-code is not meant to be exactly accurate and
> comprehensive, but it is intended to summarize the HW behavior and
> explain what can cause the different fault cases. In the real design we
> may have a separate checks to catch the above issue. I just tested on
> the hardware to ensure that HW correctly detects the above error
> condition. However, in this case we are missing a significant check (at
> least the check that the 2M region is not already assigned). I have
> raised the concern with the hardware team to look into updating the APM.

Thanks!  While you have their ear, please emphasive the importance of the pseudocode
for us software folks.  It's perfectly ok to omit or gloss over microarchitectural
details, but ISA pseudocode is often the source of truth for behavior that is
architecturally visible.
