Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F38372
	for <linux-coco@lists.linux.dev>; Thu, 15 Jul 2021 18:56:41 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id 62so7499713pgf.1
        for <linux-coco@lists.linux.dev>; Thu, 15 Jul 2021 11:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=n4/4wnowezgYAcO8PLspC/E18g0vHJpWDQH9C88XPvE=;
        b=PEYSJW5ywitp83MZTMzWpoWAjMd6cRgpvN+WoN5IgceUfvr7eYZ+iIY/sdVTeQ4f3z
         55r7On1no16MG/cV7wm6lQa+OWP9zu/zlUvwcb1/68aSQhLjTEu92b1Bi0ayZXK9+RDB
         e4u4LI9SR6fRJj0fTDRUxaYmrVA1qS/Izi32/2SK1zG9NhTviCXYPgH2Y+saYsJgC8II
         mZDg+jmHoNXhrvWTeqw6JEn+PlxtoP2fB8T8s/O/6xzBaR+p5y4OKdR7077r5EuhbFLZ
         cgxPO/8BODmINWQNHeTO9uzNEe+l0CEt+ZZenQK9vDBLW5XYwqZ14jMGtdHyw5ktP6JP
         LtTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=n4/4wnowezgYAcO8PLspC/E18g0vHJpWDQH9C88XPvE=;
        b=q8WReEysmPzN4MQOI4isXuXmZwKBn7jnm7V0QpcpoW0kJexGJLiDbXkEp0j0uRImQ5
         cLC5qDH9QRCZQhSQqevSW+tk47YjwJA6AUbGxLHSxPLvg/Zz+/Jnff8RmCkv62CjPsZ7
         vLxZfjKpd4LNFTpjLBOp+UEG1QTme1K34C9y38ePCbc6sn9+79HHLTf18KEJ3xVDggFX
         IBbCJrIuzbvaGqw5wzPTXZNR8ziPLFur6TiG8URR8g8K9pyj5ZLhzdkMV7EvJhWiOMkO
         VyupcrGiniN50bB8YQ9EvC0JIPx+3PomjlYqfBAsHSAl8hm5aKVyg0qvt7h893stEB/L
         +MnA==
X-Gm-Message-State: AOAM530u2P8REqDOemz0sr7vfCm3hBuzeM5as6j8H1YG8RP/NLFVrzaV
	+2jNByhM2lclgIroqLNUBPA7FA==
X-Google-Smtp-Source: ABdhPJyogjmWEjLfXV67H9TMDIAfEMbPO+MfSgWNeUFUmwzfnR9voMcOxAjAQpWD9XX7wn4ODnJYlw==
X-Received: by 2002:a65:614d:: with SMTP id o13mr5988572pgv.351.1626375400818;
        Thu, 15 Jul 2021 11:56:40 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id r29sm7413174pfq.102.2021.07.15.11.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 11:56:40 -0700 (PDT)
Date: Thu, 15 Jul 2021 18:56:36 +0000
From: Sean Christopherson <seanjc@google.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Peter Gonda <pgonda@google.com>, Brijesh Singh <brijesh.singh@amd.com>,
	x86@kernel.org, linux-kernel@vger.kernel.org,
	kvm list <kvm@vger.kernel.org>, linux-efi@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, linux-coco@lists.linux.dev,
	linux-mm@kvack.org, linux-crypto@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>,
	Andy Lutomirski <luto@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Sergio Lopez <slp@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Dov Murik <dovmurik@linux.ibm.com>,
	Tobin Feldman-Fitzthum <tobin@ibm.com>,
	Borislav Petkov <bp@alien8.de>, Michael Roth <michael.roth@amd.com>,
	Vlastimil Babka <vbabka@suse.cz>, tony.luck@intel.com,
	Nathaniel McCallum <npmccallum@redhat.com>,
	brijesh.ksingh@gmail.com
Subject: Re: [PATCH Part2 RFC v4 06/40] x86/sev: Add helper functions for
 RMPUPDATE and PSMASH instruction
Message-ID: <YPCE5D6h7V0iZiX/@google.com>
References: <20210707183616.5620-1-brijesh.singh@amd.com>
 <20210707183616.5620-7-brijesh.singh@amd.com>
 <CAMkAt6quzRMiEJ=iYDocRvpaYuNcV5vm=swbowK+KG=j7FjyKA@mail.gmail.com>
 <8ab309cd-8465-d543-55c8-5f6529fe74fd@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ab309cd-8465-d543-55c8-5f6529fe74fd@intel.com>

On Mon, Jul 12, 2021, Dave Hansen wrote:
> On 7/12/21 11:44 AM, Peter Gonda wrote:
> >> +int psmash(struct page *page)
> >> +{
> >> +       unsigned long spa = page_to_pfn(page) << PAGE_SHIFT;
> >> +       int ret;
> >> +
> >> +       if (!cpu_feature_enabled(X86_FEATURE_SEV_SNP))
> >> +               return -ENXIO;
> >> +
> >> +       /* Retry if another processor is modifying the RMP entry. */
> >> +       do {
> >> +               /* Binutils version 2.36 supports the PSMASH mnemonic. */
> >> +               asm volatile(".byte 0xF3, 0x0F, 0x01, 0xFF"
> >> +                             : "=a"(ret)
> >> +                             : "a"(spa)
> >> +                             : "memory", "cc");
> >> +       } while (ret == FAIL_INUSE);
> > Should there be some retry limit here for safety? Or do we know that
> > we'll never be stuck in this loop? Ditto for the loop in rmpupdate.
> 
> It's probably fine to just leave this.  While you could *theoretically*
> lose this race forever, it's unlikely to happen in practice.  If it
> does, you'll get an easy-to-understand softlockup backtrace which should
> point here pretty quickly.

But should failure here even be tolerated?  The TDX cases spin on flows that are
_not_ due to (direct) contenion, e.g. a pending interrupt while flushing the
cache or lack of randomness when generating a key.  In this case, there are two
CPUs racing to modify the RMP entry, which implies that the final state of the
RMP entry is not deterministic.

> I think TDX has a few of these as well.  Most of the "SEAMCALL"s from
> host to the firmware doing the security enforcement have something like
> an -EBUSY as well.  I believe they just retry forever too.
