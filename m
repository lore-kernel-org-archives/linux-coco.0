Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9393481
	for <linux-coco@lists.linux.dev>; Fri, 30 Jul 2021 22:42:35 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id m10-20020a17090a34cab0290176b52c60ddso16398853pjf.4
        for <linux-coco@lists.linux.dev>; Fri, 30 Jul 2021 15:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=m4d9ZD9p7GoqrvGaiugJJi1dtX5ER6dFXKneRi0unZQ=;
        b=UD+a7OHG6R6O1/v3XLdigN6MDc2FUkFXi8AJqiXtL/E14oNXaLlRshONH4ZEV3U+2l
         O+FzXhy3YiQv+j4no8ejXyA6qCG/BbE0OuzfWVYJOTMwDIotwWFqUQUQbBd3T5DPGMSF
         5iPGQsZVmTereOWIZlj3lJLfB/t9OU1fBzXXyuzxnV5O4y5+GR2wmZ824olLGhYcqMkt
         E93R50vJJPqYgYn7QQLQWVtvwHr9P+fVXsYDY1SeyAqQ9+CWTTX/I6WqGr0+IR6ZayAB
         b3TfGwNivuG/xRxTkOXgXhJ1+wvMpC744swkcitnGwK5utnhKiWijfQde9qagLVzSfIq
         ULgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=m4d9ZD9p7GoqrvGaiugJJi1dtX5ER6dFXKneRi0unZQ=;
        b=kvBLdJavP5eRSSihhg6plrrejnaJx3+gnH8U28tBHIF93GJYRljqaRhZqVgq/ePJUI
         hZrSK56qaJXrPez8J00qyH0q9gynwwny1ddQPA97mlknR+pjKCF9vjfG/oVUGY6UbL26
         Bj7XWxKXshbSXxTroa1Vhpxrd9xt5IbgYDXhtKXTNlNfTQuzyDXwA8Q+w1H7y55TcE4g
         cjFoPp3YiD5CqLcfO68FSUN4fW78V4ToZYNvd5hvboQGT5hnbwOBlug2Y6kEu01hzAoX
         utsJRg0Z0ODh3qQDEJGAX87YQ6aCUEZunYytptlwFRBqLra4CWaGy0zt/GuW0lZVHRa/
         ieuQ==
X-Gm-Message-State: AOAM530gKLz9Xh79zMR4nvmtkNWCT/K04XYhzrSRIWUh+I6UnUtfXjYH
	iVVMlqc8RGHlWHiiBSVVhVqIBg==
X-Google-Smtp-Source: ABdhPJxk7W+2sIVLDSmSMOXUC11qCNLIDPGNOd/xxKNg/QQ+ueW+7XNXlkhxJYUWIL4woVvOFDCobg==
X-Received: by 2002:a62:bd15:0:b029:31c:a584:5f97 with SMTP id a21-20020a62bd150000b029031ca5845f97mr4921999pff.33.1627684955184;
        Fri, 30 Jul 2021 15:42:35 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id n23sm3926800pgv.76.2021.07.30.15.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 15:42:34 -0700 (PDT)
Date: Fri, 30 Jul 2021 22:42:30 +0000
From: Sean Christopherson <seanjc@google.com>
To: Joerg Roedel <joro@8bytes.org>
Cc: x86@kernel.org, Eric Biederman <ebiederm@xmission.com>,
	kexec@lists.infradead.org, Joerg Roedel <jroedel@suse.de>,
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
Subject: Re: [PATCH 11/12] x86/sev: Handle CLFLUSH MMIO events
Message-ID: <YQSAVo0CXUKHXdLF@google.com>
References: <20210721142015.1401-1-joro@8bytes.org>
 <20210721142015.1401-12-joro@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210721142015.1401-12-joro@8bytes.org>

On Wed, Jul 21, 2021, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Handle CLFLUSH instruction to MMIO memory in the #VC handler. The
                               ^
			       |- emulated

> instruction is ignored by the handler, as the Hypervisor is
> responsible for cache management of emulated MMIO memory.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  arch/x86/kernel/sev-shared.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/x86/kernel/sev-shared.c b/arch/x86/kernel/sev-shared.c
> index a7a0793c4f98..682fa202444f 100644
> --- a/arch/x86/kernel/sev-shared.c
> +++ b/arch/x86/kernel/sev-shared.c
> @@ -632,6 +632,15 @@ static enum es_result vc_handle_mmio_twobyte_ops(struct ghcb *ghcb,
>  	long *reg_data;
>  
>  	switch (insn->opcode.bytes[1]) {
> +		/* CLFLUSH */
> +	case 0xae:
> +		/*
> +		 * Ignore CLFLUSHes - those go to emulated MMIO anyway and the
> +		 * hypervisor is responsible for cache management.

This wording can be misread as "the hypervisor is responsible for _all_ cache
management".  Maybe just:

		/*
		 * Ignore CLFLUSHes - the hyperivsor is responsible for cache
		 * management of emulated MMIO.
		 */

Side topic, out of curisoity, what's mapping/accessing emulated MMIO as non-UC?

> +		 */
> +		ret = ES_OK;
> +		break;
> +
>  		/* MMIO Read w/ zero-extension */
>  	case 0xb6:
>  		bytes = 1;
> -- 
> 2.31.1
> 
