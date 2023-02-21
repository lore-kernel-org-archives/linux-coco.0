Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151418F78
	for <linux-coco@lists.linux.dev>; Tue, 21 Feb 2023 21:15:19 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id s20so7161698lfb.11
        for <linux-coco@lists.linux.dev>; Tue, 21 Feb 2023 13:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHZsoxAUB1qOQOkvHNT7weaGeMzKDk1Ga8sccYf8xcg=;
        b=OrCTf5cZvZYUFHI/0GymXf51VnjzTEY6BgE6OrAmYOmm3bTTSSA/UOLWlCMCPQgC55
         aq/YEqGEdbQYHMH3n0OOtLUx4JdtIzXhNaW/00LFoLB5SuhiiGu50b+Z01CJUMHv5p/4
         NYLXgGXknyT5MCEWl49qH7N0/jJyC7vfTes8ZPD0yelwnYzHg1uB20y5h9njG0maWaBv
         /g66EkEgzHXRbMhMWWYfDGeCcIN5xCebQHh1hIY7T+cZOXQ3CrYc+/9NCPUq2UhZvxYv
         m43zjB2VgOxSsjzRswksXL8PVuUPSf74n7sRrPJFEMiAbtLH1ZcEF2jFhHBc/ZUjU8VN
         ky8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gHZsoxAUB1qOQOkvHNT7weaGeMzKDk1Ga8sccYf8xcg=;
        b=XduAeuh8Cl+8Jm5XIqEwEIbLKpOJeIndWSqfcA1xvKkSsZYlUU4y/VJmEm1uGKsfuy
         dRqAKsGZOMjZzI1rL4/e5vK6SyPGOAJmG8SV4muIEYhq/DQk6pOnDnFSDsqd2y0qah3j
         k38TMDVky32HZfjzDwn1Kg77HoRyhTg4ap18utvs+5cj/wjSLdx4lioYkAwXJSGhalew
         tnuvKWphmgzuDLJ+whulPNIYo1VOH+OqO1kSvGVYjVKVWiVxBoaGNOjEvtzT/N+O/UGJ
         HzRHYY5qutfpmovu7fDM97uAGyK+OssnSyIL7rShh3FFoWrx51lFOmCy9/mKsIdQp+Ay
         s/fw==
X-Gm-Message-State: AO0yUKW22tpsxvV9JyPfpyAv0Qhmh2doCVYLuBenNTLEzV5EYBhRuK6y
	lk7sAowxHUKQY5if2695PNQ=
X-Google-Smtp-Source: AK7set8NjTzhXspfN0nv7/0jUg0gxiYbQwoM+JmD4tCTFmj26oQh0HeivTpT3TU1zBHWBaGTqt8wqQ==
X-Received: by 2002:a19:7014:0:b0:4d0:e044:f865 with SMTP id h20-20020a197014000000b004d0e044f865mr1873623lfc.6.1677014117822;
        Tue, 21 Feb 2023 13:15:17 -0800 (PST)
Received: from localhost (88-115-161-74.elisa-laajakaista.fi. [88.115.161.74])
        by smtp.gmail.com with ESMTPSA id v23-20020a197417000000b004d23763fe96sm1941493lfe.72.2023.02.21.13.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 13:15:17 -0800 (PST)
Date: Tue, 21 Feb 2023 23:15:14 +0200
From: Zhi Wang <zhi.wang.linux@gmail.com>
To: "Kalra, Ashish" <ashish.kalra@amd.com>
Cc: Michael Roth <michael.roth@amd.com>, kvm@vger.kernel.org,
 linux-coco@lists.linux.dev, linux-mm@kvack.org,
 linux-crypto@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 tglx@linutronix.de, mingo@redhat.com, jroedel@suse.de,
 thomas.lendacky@amd.com, hpa@zytor.com, ardb@kernel.org,
 pbonzini@redhat.com, seanjc@google.com, vkuznets@redhat.com,
 jmattson@google.com, luto@kernel.org, dave.hansen@linux.intel.com,
 slp@redhat.com, pgonda@google.com, peterz@infradead.org,
 srinivas.pandruvada@linux.intel.com, rientjes@google.com,
 dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, vbabka@suse.cz,
 kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com,
 marcorr@google.com, sathyanarayanan.kuppuswamy@linux.intel.com,
 alpergun@google.com, dgilbert@redhat.com, jarkko@kernel.org,
 nikunj.dadhania@amd.com, Brijesh Singh <brijesh.singh@amd.com>
Subject: Re: [PATCH RFC v8 24/56] crypto: ccp: Handle the legacy TMR
 allocation when SNP is enabled
Message-ID: <20230221231514.00004b27@gmail.com>
In-Reply-To: <f70a2398-bd78-24aa-b0ae-9171465d50ff@amd.com>
References: <20230220183847.59159-1-michael.roth@amd.com>
	<20230220183847.59159-25-michael.roth@amd.com>
	<20230221112823.000063e4@gmail.com>
	<f70a2398-bd78-24aa-b0ae-9171465d50ff@amd.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 21 Feb 2023 09:31:01 -0600
"Kalra, Ashish" <ashish.kalra@amd.com> wrote:

> >> +static int snp_reclaim_pages(unsigned long paddr, unsigned int npages, bool locked)
> >> +{
> >> +	/* Cbit maybe set in the paddr */
> > 
> > This is confusing.
> > 
> > I suppose C-bit is treated as a attribute of PTE in the kernel not part of the
> > PA. It means only a PTE might carry a C-bit.
> > 
> 
> snp_reclaim_pages() is also called for reclaiming guest memory, in which 
> case the (guest) paddr will have the C-bit set. Hence this C-bit 
> handling is done within snp_reclaim_pages() so that the callers don't 
> need to handle it explicitly.

Thanks for the explanation.

Do you mean it will be used like that in the later patch? Sorry if it is in the
later patch as I was making progress slowly. It is quite a big patch set.

At least, I don't see that kind of usage in the current patch. Feel free to
correct me if I am wrong.

The call chains:

__snp_free_firmware_page()
    snp_reclaim_pages();

As __snp_free_firmware_page() takes struct page*, all the follwing coversion
from it would not carry C-bit.

__snp_alloc_firmware_pages()
  rmp_mark_pages_firmware()
    snp_reclaim_pages()

As __snp_alloc_firmware_page() allocates page with struct page*, the same
conclusion as above.

> 
> 
> > The paddr is from __pa(page_address()). It is not extracted from a PTE. Thus, the
> > return from them should never have a C-bit.
> > 
> > BTW: Wouldn't it be better to have pfn as input param instead of paddr?
> > 
> > The caller has struct page, calling snp_reclaim_pages(page_to_pfn(page), xxxxx)
> > would be much clearer than the current conversion:
> > page_address() (struct page is converted to VA), __pa() (VA is converted to PA)
> > in the caller and then PA is converted to pfn here.
> > 
> >> +	unsigned long pfn = __sme_clr(paddr) >> PAGE_SHIFT;
> >> +	int ret, err, i, n = 0;
> >> +
> > 
> > should be unsigned int i, n; as the input param npage is unsigned int.
> > 
> >> +	if (!pfn_valid(pfn)) {
> >> +		pr_err("%s: Invalid PFN %lx\n", __func__, pfn);
> >> +		return 0;
> >> +	}
> >> +
> >> +	for (i = 0; i < npages; i++, pfn++, n++) {
> >> +		paddr = pfn << PAGE_SHIFT;
> >> +
> >> +		if (locked)
> >> +			ret = __sev_do_cmd_locked(SEV_CMD_SNP_PAGE_RECLAIM, &paddr, &err);
> >> +		else
> >> +			ret = sev_do_cmd(SEV_CMD_SNP_PAGE_RECLAIM, &paddr, &err);
> >> +
> >> +		if (ret)
> >> +			goto cleanup;
> >> +
> >> +		ret = rmp_make_shared(pfn, PG_LEVEL_4K);
> >> +		if (ret)
> >> +			goto cleanup;
> >> +	}
> >> +
> >> +	return 0;
> >> +
> >> +cleanup:
> >> +	/*
> >> +	 * If failed to reclaim the page then page is no longer safe to
> >> +	 * be release back to the system, leak it.
> >> +	 */
> >> +	snp_mark_pages_offline(pfn, npages - n);
> >> +	return ret;
> >> +}
> >> +
> >> +static int rmp_mark_pages_firmware(unsigned long paddr, unsigned int npages, bool locked)
> > 
> > The same comment as above. Better take pfn or page instead of paddr with
> > redundant conversions.
> > 
> 
> Again, the paddr can point to guest memory so it can have C-bit set.
> 
> Thanks,
> Ashish
> 
> >> +{
> >> +	/* Cbit maybe set in the paddr */
> >> +	unsigned long pfn = __sme_clr(paddr) >> PAGE_SHIFT;
> >> +	int rc, n = 0, i;
> >> +
> >> +	for (i = 0; i < npages; i++, n++, pfn++) {
> >> +		rc = rmp_make_private(pfn, 0, PG_LEVEL_4K, 0, true);
> >> +		if (rc)
> >> +			goto cleanup;
> >> +	}
> >> +
> >> +	return 0;
> >> +
> >> +cleanup:
> >> +	/*
> >> +	 * Try unrolling the firmware state changes by
> >> +	 * reclaiming the pages which were already changed to the
> >> +	 * firmware state.
> >> +	 */
> >> +	snp_reclaim_pages(paddr, n, locked);
> >> +
> >> +	return rc;
> >> +}
> >> +

