Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8BB72
	for <linux-coco@lists.linux.dev>; Wed, 12 May 2021 17:38:34 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id y32so18688924pga.11
        for <linux-coco@lists.linux.dev>; Wed, 12 May 2021 10:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ygukMSZ6mguXZGZCEiXIOEJ1Ou3kN4uMuhJTb1ptDIQ=;
        b=aXvwhA4SMeZkjzvQvbiETGvNAb2DW9SKROVUAae6HB3DVvXq17O96jqoZbLxV9WKy4
         6pxWvKKC9OC18rcxw5IF8aal6YBlmThgbKX5w18PudVXAWgCcMhfEn5QQgzdeqe2JNVO
         lDDbYBrELxRRY+pM82COQUTEbS52U4d2TK/IIWHJP3+Q+EcRTBiF5L7TGFcRapr4PunV
         cw91rrN/yQBF9KZmHUWj7OeWzVio3XpBzFn6gR4JIWEWZYDFaVUzCJDUXqX5R5TKlQPR
         b+bCPrxxd1/ixHoqp72R2BOqR54trN2dX3sUaMjyNtbpMiNWGODg24Cy8qXWN3hmWaT1
         JcnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ygukMSZ6mguXZGZCEiXIOEJ1Ou3kN4uMuhJTb1ptDIQ=;
        b=T9CoJc/3HeSLup9a7Uc3noV8OhTKo8HTf00e6H3JoexCKtglj1Lqrip3rmJYOIVjw7
         fRjvf8pTZhHJwa5mQDH/DLbvELJy6zxYi9j9AbATLPKI69PSnvQmkE7AG6xhwstYLAu7
         igU9PMlBlCgpiCpa2RPdFbjNspn/lRF2vR/2qTd+9OvZfcqAgikNFrDQAoINnSMGY4Wa
         rz5/UBnNqjEtYBO4xOC3yqRpPJ+mWBAkJ6S7IVt7zxpXRJ64Mq8ixbjqU4UFFkOyvqqV
         LTEKudPi8lDQZI5eeL0o0hLcLce7nWdhKlP/BLIdRZ5Tv4WJ/DnurfIxqRC54IfWK6nD
         JstQ==
X-Gm-Message-State: AOAM533ea3A4yz1UfRl4BtyXMg55TsEbHRHP04sg1jsUjJVh1R5xUrrV
	TAsuik8GEIqw0xogWJfdQ0JaXA==
X-Google-Smtp-Source: ABdhPJz7ZGBw/PUTscy3NA7kLlxFOShh6OFXdGf+R8J7hxnn+s1GWr4QOvbmGe5JQFSmOdIskkO9FQ==
X-Received: by 2002:aa7:85d0:0:b029:28e:80ff:cbf4 with SMTP id z16-20020aa785d00000b029028e80ffcbf4mr36669418pfn.59.1620841113580;
        Wed, 12 May 2021 10:38:33 -0700 (PDT)
Received: from google.com (240.111.247.35.bc.googleusercontent.com. [35.247.111.240])
        by smtp.gmail.com with ESMTPSA id b6sm318783pjk.13.2021.05.12.10.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 10:38:32 -0700 (PDT)
Date: Wed, 12 May 2021 17:38:29 +0000
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
Subject: Re: [PATCH 4/6] Revert "x86/sev-es: Handle string port IO to kernel
 memory properly"
Message-ID: <YJwSlVnHb0SZTSrG@google.com>
References: <20210512075445.18935-1-joro@8bytes.org>
 <20210512075445.18935-5-joro@8bytes.org>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210512075445.18935-5-joro@8bytes.org>

On Wed, May 12, 2021, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> This reverts commit 7024f60d655272bd2ca1d3a4c9e0a63319b1eea1.
> 
> The commit reverted here introduces a short-cut into the #VC handlers
> memory access code which only works reliably in task context. But the
> kernels #VC handler can be invoked from any context, making the
> access_ok() call trigger a warning with CONFIG_DEBUG_ATOMIC_SLEEP
> enabled.
> 
> Also the memcpy() used in the reverted patch is wrong, as it has no
> page-fault handling. Access to kernel memory can also fault due to
> kernel bugs, and those should not be reported as faults from the #VC
> handler but as bugs of their real call-site, which is correctly later
> done from vc_forward_exception().

The changelog should call out that a previous patch fixed the original bug by
switching to unchecked versions of get/put.  Without that, this reads like we're
reverting to even worse behavior.

Alternatively, and probably even better, fold this revert into the switch to
the unchecked version (sounds like those will use kernel-specific flavors?).

> Fixes: 7024f60d6552 ("x86/sev-es: Handle string port IO to kernel memory properly")
> Cc: stable@vger.kernel.org # v5.11
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  arch/x86/kernel/sev.c | 12 ------------
>  1 file changed, 12 deletions(-)
> 
> diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
> index 110b39345b40..f4f319004713 100644
> --- a/arch/x86/kernel/sev.c
> +++ b/arch/x86/kernel/sev.c
> @@ -333,12 +333,6 @@ static enum es_result vc_write_mem(struct es_em_ctxt *ctxt,
>  	u16 d2;
>  	u8  d1;
>  
> -	/* If instruction ran in kernel mode and the I/O buffer is in kernel space */
> -	if (!user_mode(ctxt->regs) && !access_ok(target, size)) {
> -		memcpy(dst, buf, size);
> -		return ES_OK;
> -	}
> -
>  	switch (size) {
>  	case 1:
>  		memcpy(&d1, buf, 1);
> @@ -388,12 +382,6 @@ static enum es_result vc_read_mem(struct es_em_ctxt *ctxt,
>  	u16 d2;
>  	u8  d1;
>  
> -	/* If instruction ran in kernel mode and the I/O buffer is in kernel space */
> -	if (!user_mode(ctxt->regs) && !access_ok(s, size)) {
> -		memcpy(buf, src, size);
> -		return ES_OK;
> -	}
> -
>  	switch (size) {
>  	case 1:
>  		if (__get_user(d1, s))
> -- 
> 2.31.1
> 
