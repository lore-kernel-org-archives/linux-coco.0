Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289398F75
	for <linux-coco@lists.linux.dev>; Wed, 22 Feb 2023 20:24:26 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id r27so9522937lfe.10
        for <linux-coco@lists.linux.dev>; Wed, 22 Feb 2023 12:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677097464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c+88bH++uusEhsdCC8mbBZL+IqsNGdL/GWZjkaswK2g=;
        b=TJefIB0qefiV0E0Eh1hvJ3Ok+jvjjbxXtGzunNbw3xbB0mLj8aZB6Xz6/dfJEWmZLV
         dIRe6mkVqEYCmWm5sjhsgpaI5Sir+3QpDea40ZLSjncBq3UgEsDDr14oiw2YB6vGI66C
         CQkmGMi/QtXDGjllQwOWjDCshZdYumOJCoFGCVxGD5jYNpf1df9b4o1NKn+jrtR+cZ4B
         L3v35eXWzc6k5T42Pjk9J3br4ElN/hd0mUS4uRDs2sTjuhnTYEJv2C63Of1b7m149Vfc
         Zpg6vGjONgTyHKz2nSnMiYpCmr34O1+LUNOC5YbxUmkNgEPvhMY1V6M923H2cVZ0WFFI
         R10g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677097464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c+88bH++uusEhsdCC8mbBZL+IqsNGdL/GWZjkaswK2g=;
        b=tG5EW/QM0yeUSHPVL78x8Pi3bO9PfLHJpxnX9n7gs36X7D/3150D9JEBha3KhXdzfv
         vboAQf9y4ejMLRCopFi+uXKHiCBhjkxzsfhMuI2gSBXL5Va6Qoe8lJ/Jx06bHcWEyTbB
         urG9SX8y6q58xqhNM6QgzClOrSx1CmdWJCwi+6+dDbwNoGK6DUkl18JO+I5XziF23BEA
         aiicoaR1FicYlhxFK1jbYkOmPqQKiggnK+HbujjNdmaYwrKkbt8ChwkOVw4zyRagrKG/
         0zW+PUVms93/0edtxCyKaynSq/R0aDWIugol4EVO8aCVeDw/Tp64ykLxZmE7Xc+c+7e2
         5PTw==
X-Gm-Message-State: AO0yUKUdrKi40IDza4EN4u/YiIjDl4WQWAi6gSFX/dzM0DiA8IBKoR27
	LPeZSCatJwUfvrIZg7668tY=
X-Google-Smtp-Source: AK7set/Whf/6LlbBrRRKoUl5FBXbdlxpDW9V7S/fwraxQrmyav/hzmWIjYBVbXE8NNuUhPQcghsbwg==
X-Received: by 2002:ac2:5470:0:b0:4d2:a03b:2840 with SMTP id e16-20020ac25470000000b004d2a03b2840mr3520811lfn.4.1677097463919;
        Wed, 22 Feb 2023 12:24:23 -0800 (PST)
Received: from localhost (88-115-161-74.elisa-laajakaista.fi. [88.115.161.74])
        by smtp.gmail.com with ESMTPSA id a8-20020a056512020800b004cb1de3f487sm1031840lfo.104.2023.02.22.12.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 12:24:23 -0800 (PST)
Date: Wed, 22 Feb 2023 22:24:21 +0200
From: Zhi Wang <zhi.wang.linux@gmail.com>
To: Michael Roth <michael.roth@amd.com>
Cc: <kvm@vger.kernel.org>, <linux-coco@lists.linux.dev>,
 <linux-mm@kvack.org>, <linux-crypto@vger.kernel.org>, <x86@kernel.org>,
 <linux-kernel@vger.kernel.org>, <tglx@linutronix.de>, <mingo@redhat.com>,
 <jroedel@suse.de>, <thomas.lendacky@amd.com>, <hpa@zytor.com>,
 <ardb@kernel.org>, <pbonzini@redhat.com>, <seanjc@google.com>,
 <vkuznets@redhat.com>, <jmattson@google.com>, <luto@kernel.org>,
 <dave.hansen@linux.intel.com>, <slp@redhat.com>, <pgonda@google.com>,
 <peterz@infradead.org>, <srinivas.pandruvada@linux.intel.com>,
 <rientjes@google.com>, <dovmurik@linux.ibm.com>, <tobin@ibm.com>,
 <bp@alien8.de>, <vbabka@suse.cz>, <kirill@shutemov.name>,
 <ak@linux.intel.com>, <tony.luck@intel.com>, <marcorr@google.com>,
 <sathyanarayanan.kuppuswamy@linux.intel.com>, <alpergun@google.com>,
 <dgilbert@redhat.com>, <jarkko@kernel.org>, <ashish.kalra@amd.com>,
 <nikunj.dadhania@amd.com>, Brijesh Singh <brijesh.singh@amd.com>
Subject: Re: [PATCH RFC v8 28/56] crypto: ccp: Provide APIs to query
 extended attestation report
Message-ID: <20230222222421.00001a62@gmail.com>
In-Reply-To: <20230220183847.59159-29-michael.roth@amd.com>
References: <20230220183847.59159-1-michael.roth@amd.com>
	<20230220183847.59159-29-michael.roth@amd.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 20 Feb 2023 12:38:19 -0600
Michael Roth <michael.roth@amd.com> wrote:

It seems in the discussion:
https://lore.kernel.org/lkml/f18fae8b-a928-cd82-e0b3-eac62ad3e106@amd.com/,
this API is going to be removed. Will that fix land in this patch series or not?
If not, It would be better to mention it in the comment message of this one
or patch 45.
If yes, I guess this patch is not needed.

> From: Brijesh Singh <brijesh.singh@amd.com>
> 
> Version 2 of the GHCB specification defines VMGEXIT that is used to get
> the extended attestation report. The extended attestation report includes
> the certificate blobs provided through the SNP_SET_EXT_CONFIG.
> 
> The snp_guest_ext_guest_request() will be used by the hypervisor to get
> the extended attestation report. See the GHCB specification for more
> details.
> 
> Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
> Signed-off-by: Michael Roth <michael.roth@amd.com>
> ---
>  drivers/crypto/ccp/sev-dev.c | 47 ++++++++++++++++++++++++++++++++++++
>  include/linux/psp-sev.h      | 33 +++++++++++++++++++++++++
>  2 files changed, 80 insertions(+)
> 
> diff --git a/drivers/crypto/ccp/sev-dev.c b/drivers/crypto/ccp/sev-dev.c
> index b56b00ca2cd4..e65563bc8298 100644
> --- a/drivers/crypto/ccp/sev-dev.c
> +++ b/drivers/crypto/ccp/sev-dev.c
> @@ -2017,6 +2017,53 @@ int sev_guest_df_flush(int *error)
>  }
>  EXPORT_SYMBOL_GPL(sev_guest_df_flush);
>  
> +int snp_guest_ext_guest_request(struct sev_data_snp_guest_request *data,
> +				unsigned long vaddr, unsigned long *npages, unsigned long *fw_err)
> +{
> +	unsigned long expected_npages;
> +	struct sev_device *sev;
> +	int rc;
> +
> +	if (!psp_master || !psp_master->sev_data)
> +		return -ENODEV;
> +
> +	sev = psp_master->sev_data;
> +
> +	if (!sev->snp_initialized)
> +		return -EINVAL;
> +
> +	mutex_lock(&sev->snp_certs_lock);
> +	/*
> +	 * Check if there is enough space to copy the certificate chain. Otherwise
> +	 * return ERROR code defined in the GHCB specification.
> +	 */
> +	expected_npages = sev->snp_certs_len >> PAGE_SHIFT;
> +	if (*npages < expected_npages) {
> +		*npages = expected_npages;
> +		*fw_err = SNP_GUEST_REQ_INVALID_LEN;
> +		mutex_unlock(&sev->snp_certs_lock);
> +		return -EINVAL;
> +	}
> +
> +	rc = sev_do_cmd(SEV_CMD_SNP_GUEST_REQUEST, data, (int *)fw_err);
> +	if (rc) {
> +		mutex_unlock(&sev->snp_certs_lock);
> +		return rc;
> +	}
> +
> +	/* Copy the certificate blob */
> +	if (sev->snp_certs_data) {
> +		*npages = expected_npages;
> +		memcpy((void *)vaddr, sev->snp_certs_data, *npages << PAGE_SHIFT);
> +	} else {
> +		*npages = 0;
> +	}
> +
> +	mutex_unlock(&sev->snp_certs_lock);
> +	return rc;
> +}
> +EXPORT_SYMBOL_GPL(snp_guest_ext_guest_request);
> +
>  static void sev_exit(struct kref *ref)
>  {
>  	misc_deregister(&misc_dev->misc);
> diff --git a/include/linux/psp-sev.h b/include/linux/psp-sev.h
> index d19744807471..81bafc049eca 100644
> --- a/include/linux/psp-sev.h
> +++ b/include/linux/psp-sev.h
> @@ -931,6 +931,32 @@ void snp_free_firmware_page(void *addr);
>   */
>  void snp_mark_pages_offline(unsigned long pfn, unsigned int npages);
>  
> +/**
> + * snp_guest_ext_guest_request - perform the SNP extended guest request command
> + *  defined in the GHCB specification.
> + *
> + * @data: the input guest request structure
> + * @vaddr: address where the certificate blob need to be copied.
> + * @npages: number of pages for the certificate blob.
> + *    If the specified page count is less than the certificate blob size, then the
> + *    required page count is returned with error code defined in the GHCB spec.
> + *    If the specified page count is more than the certificate blob size, then
> + *    page count is updated to reflect the amount of valid data copied in the
> + *    vaddr.
> + *
> + * @sev_ret: sev command return code
> + *
> + * Returns:
> + * 0 if the sev successfully processed the command
> + * -%ENODEV    if the sev device is not available
> + * -%ENOTSUPP  if the sev does not support SEV
> + * -%ETIMEDOUT if the sev command timed out
> + * -%EIO       if the sev returned a non-zero return code
> + */
> +int snp_guest_ext_guest_request(struct sev_data_snp_guest_request *data,
> +				unsigned long vaddr, unsigned long *npages,
> +				unsigned long *error);
> +
>  #else	/* !CONFIG_CRYPTO_DEV_SP_PSP */
>  
>  static inline int
> @@ -968,6 +994,13 @@ static inline void *snp_alloc_firmware_page(gfp_t mask)
>  
>  static inline void snp_free_firmware_page(void *addr) { }
>  
> +static inline int snp_guest_ext_guest_request(struct sev_data_snp_guest_request *data,
> +					      unsigned long vaddr, unsigned long *n,
> +					      unsigned long *error)
> +{
> +	return -ENODEV;
> +}
> +
>  #endif	/* CONFIG_CRYPTO_DEV_SP_PSP */
>  
>  #endif	/* __PSP_SEV_H__ */

