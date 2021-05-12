Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7833272
	for <linux-coco@lists.linux.dev>; Wed, 12 May 2021 17:31:08 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id n3so722893plf.7
        for <linux-coco@lists.linux.dev>; Wed, 12 May 2021 10:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jQ1izlrVGOhPAXdn9/aplXdHdgbZMkL/hHrij75+k+Q=;
        b=a4DNmUDUNPSavKGBm5teXTf27JxGyXaVA19FtMli56IbhkY9lFuV+rJqzokIoTEuwj
         F49XgNCm3V3M5/9KmyOKYrZZYrD8M0sxKPi5CWvV+66QLiQRD1dTK6hnpF6oOnX3KdYl
         KuYf/BxHq4xPZ5ZcOpdXGVy7p+OIZAgc99rCcjvCYvgDQxe5GvZg2Mt/NNQY/q+08vQ0
         Hl+rCDHoUA2rv75AAhQoZLZWwV1kC9ZJJDMDoQ/lYVk1QpsvMjeAuI4uQV90enBsC69c
         FUK56tmkLe8UkPGpZbmL7IVKUmI0tUBnEDrhm26gFC5GF7vWR9q72Rtv/k6SpUDPgwUW
         EuZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jQ1izlrVGOhPAXdn9/aplXdHdgbZMkL/hHrij75+k+Q=;
        b=DPsWFOZT6593xJnW1nweiJ50I5dLL3W6XoWnLnAfrodMo5tWkViwITwXoeai+T+Unf
         LcWj8bmapgc8pNmG1GDMbwVyYKeQphe0ZCGv4Kz2v7klN4CBU4k50PkEU6rUnoWr49XS
         AlaN8b1UXZkvioxZA27MaYE/lcU4w3ZMu5BDKgFTlfnQ6qMprHYM8rUUdKhd6JR+ApD1
         ZvBvf/F7+TRXsEiM7bqFWRIMK5z8uBlpNMIcrtMVtoxsjccgfVlH5uDhs4ntGurhavCE
         nKe1tEQpaJ8rMB9cpNxTb20i30CsNFKfliF2ahcAGjT0X4sg2HrMSPVR2KDS9z8Ejhiw
         rmLA==
X-Gm-Message-State: AOAM5335dJsoVlphLwqO2YK99W9CJqJm7sQCLdVQkCe8taEXpSy3JjpL
	KOrY+3iQfYPStVd1s+7+zxfZvg==
X-Google-Smtp-Source: ABdhPJz/4rNTvkI1wMpdg6OUFlsFjzwopUXYcEfBvzxbgvGH5sNB0scPThabFLbqW1Veig+/7/0g+A==
X-Received: by 2002:a17:90a:5207:: with SMTP id v7mr11942175pjh.87.1620840667721;
        Wed, 12 May 2021 10:31:07 -0700 (PDT)
Received: from google.com (240.111.247.35.bc.googleusercontent.com. [35.247.111.240])
        by smtp.gmail.com with ESMTPSA id t15sm369192pgh.33.2021.05.12.10.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 10:31:07 -0700 (PDT)
Date: Wed, 12 May 2021 17:31:03 +0000
From: Sean Christopherson <seanjc@google.com>
To: Joerg Roedel <joro@8bytes.org>
Cc: x86@kernel.org, Hyunwook Baek <baekhw@google.com>,
	Joerg Roedel <jroedel@suse.de>, stable@vger.kernel.org,
	hpa@zytor.com, Andy Lutomirski <luto@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>, Jiri Slaby <jslaby@suse.cz>,
	Dan Williams <dan.j.williams@intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Juergen Gross <jgross@suse.com>, Kees Cook <keescook@chromium.org>,
	David Rientjes <rientjes@google.com>, Cfir Cohen <cfir@google.com>,
	Erdem Aktas <erdemaktas@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mike Stunes <mstunes@vmware.com>,
	Martin Radev <martin.b.radev@gmail.com>,
	Arvind Sankar <nivedita@alum.mit.edu>, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org
Subject: Re: [PATCH 2/6] x86/sev-es: Forward page-faults which happen during
 emulation
Message-ID: <YJwQ1xsiDtv3LkBe@google.com>
References: <20210512075445.18935-1-joro@8bytes.org>
 <20210512075445.18935-3-joro@8bytes.org>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210512075445.18935-3-joro@8bytes.org>

On Wed, May 12, 2021, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> When emulating guest instructions for MMIO or IOIO accesses the #VC
> handler might get a page-fault and will not be able to complete. Forward
> the page-fault in this case to the correct handler instead of killing
> the machine.
> 
> Fixes: 0786138c78e7 ("x86/sev-es: Add a Runtime #VC Exception Handler")
> Cc: stable@vger.kernel.org # v5.10+
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  arch/x86/kernel/sev.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
> index c49270c7669e..6530a844eb61 100644
> --- a/arch/x86/kernel/sev.c
> +++ b/arch/x86/kernel/sev.c
> @@ -1265,6 +1265,10 @@ static __always_inline void vc_forward_exception(struct es_em_ctxt *ctxt)
>  	case X86_TRAP_UD:
>  		exc_invalid_op(ctxt->regs);
>  		break;
> +	case X86_TRAP_PF:
> +		write_cr2(ctxt->fi.cr2);
> +		exc_page_fault(ctxt->regs, error_code);
> +		break;

This got me looking at the flows that "inject" #PF, and I'm pretty sure there
are bugs in __vc_decode_user_insn() + insn_get_effective_ip().

Problem #1: __vc_decode_user_insn() assumes a #PF if insn_fetch_from_user_inatomic()
fails, but the majority of failure cases in insn_get_seg_base() are #GPs, not #PF.

	res = insn_fetch_from_user_inatomic(ctxt->regs, buffer);
	if (!res) {
		ctxt->fi.vector     = X86_TRAP_PF;
		ctxt->fi.error_code = X86_PF_INSTR | X86_PF_USER;
		ctxt->fi.cr2        = ctxt->regs->ip;
		return ES_EXCEPTION;
	}

Problem #2: Using '0' as an error code means a legitimate effective IP of '0'
will be misinterpreted as a failure.  Practically speaking, I highly doubt anyone
will ever actually run code at address 0, but it's technically possible.  The
most robust approach would be to pass a pointer to @ip and return an actual error
code.  Using a non-canonical magic value might also work, but that could run afoul
of future shenanigans like LAM.

	ip = insn_get_effective_ip(regs);
	if (!ip)
		return 0;
