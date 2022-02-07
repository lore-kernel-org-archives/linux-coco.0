Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BFF2F25
	for <linux-coco@lists.linux.dev>; Mon,  7 Feb 2022 22:11:57 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id y17so12223536plg.7
        for <linux-coco@lists.linux.dev>; Mon, 07 Feb 2022 14:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iTzDr07nDR0Kl7lFwHuFFDUEMCGqC9FB/uZHfJ8d1Mw=;
        b=IYp6uTWjHF7Eyy4PczCpkHeC9xff7BNFIgUZQKzLF6A5XC4d2aZTzFxbsdu7wbLLV+
         8qnuGLKuJS6YV1HIEddyw1WBUHZINajA2y7bT6iItl4bHpP1y3IDp2m5DRlkgZSpXvBx
         C3c+GD1fb7NhmNCLjgdjXmtW+E6jQ4/6qjaflz3A1pwwoWjAHIZebaoWxL5f/KCtHbRf
         NAh8BCEcH96Xlbh6SqxxTpPe/NYIUSybli6KNHCMu3R7vj1otLza7HJFHJ7M71x203u1
         2eVL46KcknHxwS6gm9Bb18RAjr7p/addt5Ap6SGO+3ThcgyH/nig+9ouMapWeIYw1Kp0
         An7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iTzDr07nDR0Kl7lFwHuFFDUEMCGqC9FB/uZHfJ8d1Mw=;
        b=V3ULrP8BpAcjaF71AFjyxolD4aRAi+8qVfxH0nW85k919nljM9pMTAnL0kOFf64h1D
         sormcctkhQ7nZtghJ1lyn1qHzHBxbDqYkakTo7GMFIysYYjQpCWrtjqyikmZi+hhYgfm
         hnjmbwbtC6CZZkRwmP+VTawrMRUpsxTt/lYqF/mP/IHKgCMaNRv8mKBZ+5gr5JgBzUB0
         V8swHV+BlSnUy42vrsC5Q5MFrenTHAJjssFauFx5Y1erugcKhuM7v84uFc58jHlg7lXh
         jzQ03SLsbxPRQRAn8TwjfLDIEgxpp9jzqGREhA6GXVhGXvFqV9wwvcZQMRUJe8ZnBLkO
         /LoQ==
X-Gm-Message-State: AOAM531lXS6S0f/PV0Y8GKwfjMOMb7S8ILN40TPsSIpN6LXumu0kGCjZ
	QTrUgljRgfmX+2vrdtj87AZZjw==
X-Google-Smtp-Source: ABdhPJw45LFLi3Lo8mYXK0eLgPYlH0oh1NJlpAM43K6XMNbSYLI8CEbycgiys9Ieotpc3LkharP35w==
X-Received: by 2002:a17:90b:1b52:: with SMTP id nv18mr1114781pjb.136.1644271917102;
        Mon, 07 Feb 2022 14:11:57 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id iy13sm321808pjb.51.2022.02.07.14.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 14:11:56 -0800 (PST)
Date: Mon, 7 Feb 2022 22:11:53 +0000
From: Sean Christopherson <seanjc@google.com>
To: Joerg Roedel <joro@8bytes.org>
Cc: x86@kernel.org, Joerg Roedel <jroedel@suse.de>,
	Eric Biederman <ebiederm@xmission.com>, kexec@lists.infradead.org,
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
Subject: Re: [PATCH v3 05/10] x86/sev: Setup code to park APs in the AP Jump
 Table
Message-ID: <YgGZKdbr3RrzU+xk@google.com>
References: <20220127101044.13803-1-joro@8bytes.org>
 <20220127101044.13803-6-joro@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220127101044.13803-6-joro@8bytes.org>

On Thu, Jan 27, 2022, Joerg Roedel wrote:
> +static int __init sev_setup_ap_jump_table(void)

This name is really confusing.  AFAICT, it's specific to SEV-ES, but used only
"sev" for the namespace because sev_es_setup_ap_jump_table() already exists.
I assume this variant is purely for parking/offlining vCPUs?  Adding that in the
name would be helpful.

The two flows are also very, very similar, but apparently do slightly different
things.  Even more odd is that this version applies different sanity checks on
the address than the existing code.  It should be fairly simple to extract a
common helper.  That would likely help with naming problem too.

> +{
> +	size_t blob_size = rm_ap_jump_table_blob_end - rm_ap_jump_table_blob;
> +	u16 startup_cs, startup_ip;
> +	u16 __iomem *jump_table;
> +	phys_addr_t pa;
> +
> +	if (!cc_platform_has(CC_ATTR_GUEST_STATE_ENCRYPT))
> +		return 0;
> +
> +	if (ghcb_info.vm_proto < 2) {
> +		pr_warn("AP jump table parking requires at least GHCB protocol version 2\n");
> +		return 0;
> +	}
> +
> +	pa = get_jump_table_addr();
> +
> +	/* On UP guests there is no jump table so this is not a failure */
> +	if (!pa)
> +		return 0;
> +
> +	/* Check overflow and size for untrusted jump table address */
> +	if (pa + PAGE_SIZE < pa || pa + PAGE_SIZE > SZ_4G) {
> +		pr_info("AP jump table is above 4GB or address overflow - not enabling AP jump table parking\n");
> +		return 0;
> +	}
> +
> +	jump_table = ioremap_encrypted(pa, PAGE_SIZE);
> +	if (WARN_ON(!jump_table))
> +		return -EINVAL;
> +
> +	/*
> +	 * Save reset vector to restore it later because the blob will
> +	 * overwrite it.
> +	 */
> +	startup_ip = jump_table[0];
> +	startup_cs = jump_table[1];
> +
> +	/* Install AP jump table Blob with real mode AP parking code */
> +	memcpy_toio(jump_table, rm_ap_jump_table_blob, blob_size);
> +
> +	/* Setup AP jump table GDT */
> +	sev_es_setup_ap_jump_table_data(jump_table, (u32)pa);
> +
> +	writew(startup_ip, &jump_table[0]);
> +	writew(startup_cs, &jump_table[1]);
> +
> +	iounmap(jump_table);
> +
> +	pr_info("AP jump table Blob successfully set up\n");
> +
> +	/* Mark AP jump table blob as available */
> +	sev_ap_jumptable_blob_installed = true;
> +
> +	return 0;
> +}
> +core_initcall(sev_setup_ap_jump_table);
