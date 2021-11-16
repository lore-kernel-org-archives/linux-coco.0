Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D638872
	for <linux-coco@lists.linux.dev>; Tue, 16 Nov 2021 18:39:39 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id k37so11193lfv.3
        for <linux-coco@lists.linux.dev>; Tue, 16 Nov 2021 10:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y8BSCacTYyDcVPM5IoKBN/fEmfxWN/lo+RC/ugsV1kA=;
        b=rYJ0YguBFbcmp1Tg5G/C5elRrhHlqhZPZ9s8Rgi1EyZL/mBO38rP8TLiOW+ATwSvse
         hx7oPPVfHIuXUqflFoLp78XS17/oAIFNICUc0clQp+DsHzreVloNA65wQQOnbMStJO7L
         cRJz23BZ68/NRRpFbqz0JWlQ7dBZs4VkbRuFof2ir9z4E3NFYT2j+EcVSEvD7mBaI+7n
         cayKlHYWqpdyX7SKzf/EHZxBnRiaA/IxQ9tqIztiqPblFl2RiruzS7/DSXEX3z38FmRW
         AuC05B/4Cg4W+0nfuwbanEM5/q3cutNMoV8HbSx303/tnFRkK8RaZJvdv1FWALYQOU6m
         tiZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y8BSCacTYyDcVPM5IoKBN/fEmfxWN/lo+RC/ugsV1kA=;
        b=rq+EjcNhFlhq1lbITDMzeCccifqbocu5JqTVwh31N1b+qKpLlI9iOhfnOIEyf4184V
         ErMhNakOpbYyAJiGTt3G6Pxn0wr4CXYsMJxUNZN+BPNK+oWtD/wD/vXWca2SMWUKk9Yd
         xm3C4GN3lYlPSPal8yKFfwGGHqyKBtomYLpr2jqjR2dfOwP+BuV1ojECb2b8rPsj2w4I
         Ls5zHVbIBvCccZ2Je2K8FCHVLrrOoS4vF5WPuElCgAQcn+40101fmWG4k3eelCopkknE
         pTvuUUW7xqPoPgMiYdt9bWZvaW1nXNE7Aia8j5E2hneq+epI0BhB/SWNI73fL6vTrTd6
         M0ww==
X-Gm-Message-State: AOAM530Y3pRD8h95nrb9jLkP+tswrTFlO5SL7k25Vf81r4o3x3FJiWn9
	W1SiJpCRbBsNaHBv4Y3VVvWpAe+AP8YIkADyyEgORw==
X-Google-Smtp-Source: ABdhPJywTYnlEyhOxCxt2a7nHxlAjR09HGR/8hsv2oGiftn1/xaXRUoDkhP1uYAcS9P5PWYcD8g2hetueUBVXSKepCg=
X-Received: by 2002:a05:6512:3e12:: with SMTP id i18mr8517991lfv.456.1637087977701;
 Tue, 16 Nov 2021 10:39:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <061ccd49-3b9f-d603-bafd-61a067c3f6fa@intel.com>
 <YY6z5/0uGJmlMuM6@zn.tnic> <YY7FAW5ti7YMeejj@google.com> <YZJTA1NyLCmVtGtY@work-vm>
 <YZKmSDQJgCcR06nE@google.com> <CAA03e5E3Rvx0t8_ZrbNMZwBkjPivGKOg5HCShSFYwfkKDDHWtA@mail.gmail.com>
 <YZKxuxZurFW6BVZJ@google.com> <CAA03e5GBajwRJBuTJLPjji7o8QD2daEUJU7DpPJBxtWsf-DE8g@mail.gmail.com>
 <8a244d34-2b10-4cf8-894a-1bf12b59cf92@www.fastmail.com> <YZOwbjGVEfa/wLaS@suse.de>
 <YZP31a8acsfD+snJ@google.com>
In-Reply-To: <YZP31a8acsfD+snJ@google.com>
From: Peter Gonda <pgonda@google.com>
Date: Tue, 16 Nov 2021 11:39:25 -0700
Message-ID: <CAMkAt6o=G4U8iUkLxquT9E2JsyxVASOhNZcA9s7JFnrVPf_hfA@mail.gmail.com>
Subject: Re: [PATCH Part2 v5 00/45] Add AMD Secure Nested Paging (SEV-SNP)
 Hypervisor Support
To: Sean Christopherson <seanjc@google.com>
Cc: Joerg Roedel <jroedel@suse.de>, Andy Lutomirski <luto@kernel.org>, Marc Orr <marcorr@google.com>, 
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@intel.com>, 
	Brijesh Singh <brijesh.singh@amd.com>, "the arch/x86 maintainers" <x86@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kvm list <kvm@vger.kernel.org>, 
	linux-coco@lists.linux.dev, linux-mm@kvack.org, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Tom Lendacky <Thomas.Lendacky@amd.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
	Jim Mattson <jmattson@google.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Sergio Lopez <slp@redhat.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, David Rientjes <rientjes@google.com>, 
	Dov Murik <dovmurik@linux.ibm.com>, Tobin Feldman-Fitzthum <tobin@ibm.com>, 
	Michael Roth <michael.roth@amd.com>, Vlastimil Babka <vbabka@suse.cz>, 
	"Kirill A . Shutemov" <kirill@shutemov.name>, Andi Kleen <ak@linux.intel.com>, 
	Tony Luck <tony.luck@intel.com>, 
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>, Marc Zyngier <maz@kernel.org>, 
	Will Deacon <will@kernel.org>, Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 16, 2021 at 11:26 AM Sean Christopherson <seanjc@google.com> wrote:
>
> On Tue, Nov 16, 2021, Joerg Roedel wrote:
> > But as Marc already pointed out, the kernel needs a plan B when an RMP
> > happens anyway due to some bug.
>
> I don't see why unexpected RMP #PF is a special snowflake that needs a different
> plan than literally every other type of unexpected #PF in the kernel.

When I started this thread I was not trying to say we *need* to do
something different for RMP faults, but that we *could* improve host
reliability by doing something. Since it is possible to special case
an RMP fault and prevent a panic I thought it was with discussing.
