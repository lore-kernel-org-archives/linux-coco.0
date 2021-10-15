Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37ACA2C82
	for <linux-coco@lists.linux.dev>; Fri, 15 Oct 2021 18:05:53 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id q19so9036714pfl.4
        for <linux-coco@lists.linux.dev>; Fri, 15 Oct 2021 11:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6aKaUBfmZ/RDXszMaOimAv4KMW/OyS3sPGtjs8O2E34=;
        b=GVmzuU15JAJiFkhxCvlybvv8JQ/weN1u6H5X2ykdGO0SbPC2oh+6v6cVgvlO570SQt
         3GkvfNVzAqWl8zPNWSHbY7njqG6CewmKP4h1XOj6yKnHOyQYUzyjQPvU2OuC15dfq4Hi
         VN3x/O+P0ilrNaIVGJ68Ygk351wgrsLm7ndELutEZZrw8z+cY1yzXMgBMy/pBci3EOyl
         ulcHWdF/9vBkEsUgkf7h44ja1u6SEY2tkk+eSi5LWgBg9XB/icMRuY+GRaP+xW3MrzGB
         XuNyraHQEXo08aqdnameuEFfd5qdBGYdt1wmlmW6lyc7tCbSiQ7jQ3umV9arDxtAw+lt
         E+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6aKaUBfmZ/RDXszMaOimAv4KMW/OyS3sPGtjs8O2E34=;
        b=YGR7lK892AM8arnyAsHXTVN6E7x850QK2+DNbJiaOwdXD9mii89HcVbVCHTofwtVFZ
         ZZOFTcXLF0hZljjAa+MM1OnyB6I2HyLkNWbhRSyhCDUCM62iYL0EQnk8V2osidhDAbSp
         0T5GMPHDmlpPCy+mClLBwuNhOBl8VMcENrYMGP3IM3If08GhYdyZqnNCztBsxUxgKGZ/
         U2BMAtQ7LU4jH4T2BId2/+B8LrZ9TuvvusRJlpYGLDJcXtng73KrVXVFmyO8HA1gDokc
         vBXt1vcqX8j9ouQeZsP4GZgttDtvsFXcBbr+L1LYuKPUillK2F05hgxhTWtNDCG4wiZt
         WYyg==
X-Gm-Message-State: AOAM531rMLAj1BOEqDF3RAVdsrxCqXM8u1YQhnYw61btaSatG9MUonld
	wT1uTrUMX7hCeEadCIUNhKVeKw==
X-Google-Smtp-Source: ABdhPJzz3Nh77XlAC6fmajJ34SeI4VWlWS8ZkGOVsmolRrMLTNk0lzHHckKjtlG+93CIt4Ywfy5cfA==
X-Received: by 2002:a63:6a49:: with SMTP id f70mr7399062pgc.199.1634321152413;
        Fri, 15 Oct 2021 11:05:52 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id w15sm5543737pfc.220.2021.10.15.11.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 11:05:51 -0700 (PDT)
Date: Fri, 15 Oct 2021 18:05:47 +0000
From: Sean Christopherson <seanjc@google.com>
To: Brijesh Singh <brijesh.singh@amd.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
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
	Vlastimil Babka <vbabka@suse.cz>,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	Andi Kleen <ak@linux.intel.com>, tony.luck@intel.com,
	marcorr@google.com, sathyanarayanan.kuppuswamy@linux.intel.com
Subject: Re: [PATCH Part2 v5 05/45] x86/sev: Add helper functions for
 RMPUPDATE and PSMASH instruction
Message-ID: <YWnC++azH3xXrMm6@google.com>
References: <20210820155918.7518-1-brijesh.singh@amd.com>
 <20210820155918.7518-6-brijesh.singh@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210820155918.7518-6-brijesh.singh@amd.com>

On Fri, Aug 20, 2021, Brijesh Singh wrote:
> diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
> index f383d2a89263..8627c49666c9 100644
> --- a/arch/x86/kernel/sev.c
> +++ b/arch/x86/kernel/sev.c
> @@ -2419,3 +2419,75 @@ int snp_lookup_rmpentry(u64 pfn, int *level)
>  	return !!rmpentry_assigned(e);
>  }
>  EXPORT_SYMBOL_GPL(snp_lookup_rmpentry);
> +
> +int psmash(u64 pfn)
> +{
> +	unsigned long paddr = pfn << PAGE_SHIFT;

Probably better to use __pfn_to_phys()?

> +	int ret;
> +
> +	if (!pfn_valid(pfn))
> +		return -EINVAL;
> +
> +	if (!cpu_feature_enabled(X86_FEATURE_SEV_SNP))

Shouldn't this be a WARN_ON_ONCE()?

> +		return -ENXIO;
> +
> +	/* Binutils version 2.36 supports the PSMASH mnemonic. */
> +	asm volatile(".byte 0xF3, 0x0F, 0x01, 0xFF"
> +		      : "=a"(ret)
> +		      : "a"(paddr)
> +		      : "memory", "cc");
> +
> +	return ret;

I don't like returning the raw result from hardware; it's mostly works because
hardware also uses '0' for success, but it will cause confusion should hardware
ever set bit 31.  There are also failures that likely should never happen unless
there's a kernel bug, e.g. I suspect we can do:

	if (WARN_ON_ONCE(ret == FAIL_INPUT))
		return -EINVAL;
	if (WARN_ON_ONCE(ret == FAIL_PERMISSION))
		return -EPERM;
	
	....

or if all errors are "impossible"

	if (WARN_ON_ONCE(ret))
		return snp_error_code_to_errno(ret);

FAIL_INUSE and FAIL_OVERLAP also need further discussion.  It's not clear to me
that two well-behaved callers can't encounter collisions due to the 2mb <=> 4kb
interactions.  If collisions between well-behaved callers are possible, then this
helper likely needs some form of serialization.  Either, the concurrency rules
for RMP access need explicit and lengthy documentation.
