Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940163C0F
	for <linux-coco@lists.linux.dev>; Thu,  8 Sep 2022 15:11:35 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id c198so8360591pfc.13
        for <linux-coco@lists.linux.dev>; Thu, 08 Sep 2022 08:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=aTBij0MKfHujyUmk5AcvjcEPDYsuhsMOVk1UDlCpwHM=;
        b=M8sDj3UF6N8I7JnxOD5qpHcBpkICJr+jJbnZkTKusip2DzAxWgiNLQ6mj7h8OEkpD6
         7fubBL7T9kK7c3AohI7ypbXz811/OZvC5CTxzgbqPwOybqN9tFi6uw95Zcd5vSciyPK4
         S+W7qD3SR4im8zMU0XHmJV/sA6tAILo//CEVix9HLeB9cKQUbxOKii2rsTpxve1LMRmx
         5FFykgBQ2jC1ECefm4B0Xb/aBy+8hjxOghGPi8x3hmyqP5wIoPkS8aXgm2XC5x1Dnxt4
         BPW0xb5jRAoqOXGUXO/9jXwGdfBAV11vjdL1x2Ewj6q4oFlLSU6ZWuyxR/86W9GK6GRG
         dpvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=aTBij0MKfHujyUmk5AcvjcEPDYsuhsMOVk1UDlCpwHM=;
        b=MiodBCNsIbusOC80ngXlvX4y0GYLR+/RV0OGrNDOvwtOBQ3m83NJFVVEUozCKua4Jl
         gBNJaK6sGIAuFQcS2+x3v0aeAS0PXuXU5iM5e7RaiiRbYu1yCaerFO1fqIYusiUCNNFl
         dmMH9Y0jNQulZxS1vXxqA/BAhDHALpsV5SyxL3+yHby8g1u7U843Q3HzZCBBYbU4mNCa
         /hx4W6964QpnXbVSYC6lDV3FKLb1jjzLujbMkMJWUkKzIvZE9Quq8fie+6oM0s7WIvx8
         iagGPKzqtuUZrw2BamMqWZLyfCkMT3hzQQ8fwjByUKzKpVhRWOVZ9wJF7T5sC4QwrsA4
         ojnA==
X-Gm-Message-State: ACgBeo1gi6ev1anePXa624p33Z6sGM1NCKdb2vurjP3ECsDwPPUTNRO/
	/FudbvF3URWQ/sLfrPaWKmk+ug==
X-Google-Smtp-Source: AA6agR52H9GqkwF66V9j3sYZCEhIamP67gNhXAIhkPKoFl7VQPznDhLiYGxoAwhmixzGU+O0GNIEfA==
X-Received: by 2002:a05:6a00:2395:b0:536:8296:51d5 with SMTP id f21-20020a056a00239500b00536829651d5mr9625772pfc.84.1662649894875;
        Thu, 08 Sep 2022 08:11:34 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id jc3-20020a17090325c300b00174abcb02d6sm10263695plb.235.2022.09.08.08.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 08:11:34 -0700 (PDT)
Date: Thu, 8 Sep 2022 15:11:30 +0000
From: Sean Christopherson <seanjc@google.com>
To: Harald Hoyer <harald@profian.com>
Cc: ashish.kalra@amd.com, ak@linux.intel.com, alpergun@google.com,
	ardb@kernel.org, bp@alien8.de, dave.hansen@linux.intel.com,
	dgilbert@redhat.com, dovmurik@linux.ibm.com, hpa@zytor.com,
	jarkko@kernel.org, jmattson@google.com, jroedel@suse.de,
	kirill@shutemov.name, kvm@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, luto@kernel.org,
	marcorr@google.com, michael.roth@amd.com, mingo@redhat.com,
	pbonzini@redhat.com, peterz@infradead.org, pgonda@google.com,
	rientjes@google.com, sathyanarayanan.kuppuswamy@linux.intel.com,
	slp@redhat.com, srinivas.pandruvada@linux.intel.com,
	tglx@linutronix.de, thomas.lendacky@amd.com, tobin@ibm.com,
	tony.luck@intel.com, vbabka@suse.cz, vkuznets@redhat.com,
	x86@kernel.org
Subject: Re: [[PATCH for v6]] KVM: SEV: fix snp_launch_finish
Message-ID: <YxoGItJDTEjfctaS@google.com>
References: <6a513cf79bf71c479dbd72165faf1d804d77b3af.1655761627.git.ashish.kalra@amd.com>
 <20220908145557.1912158-1-harald@profian.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220908145557.1912158-1-harald@profian.com>

On Thu, Sep 08, 2022, Harald Hoyer wrote:
> The `params.auth_key_en` indicator does _not_ specify, whether an
> ID_AUTH struct should be sent or not, but, wheter the ID_AUTH struct
> contains an author key or not. The firmware always expects an ID_AUTH block.
> 
> Link: https://lore.kernel.org/all/cover.1655761627.git.ashish.kalra@amd.com/

Please provide feedback by directly responding to whatever patch/email is buggy.
Or if that's too complicated for some reason (unlikely in this case), provide the
fixup patch to the author *off-list*.

> Signed-off-by: Harald Hoyer <harald@profian.com>
> ---
>  arch/x86/kvm/svm/sev.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> index 85357dc4d231..5cf4be6a33ba 100644
> --- a/arch/x86/kvm/svm/sev.c
> +++ b/arch/x86/kvm/svm/sev.c
> @@ -2242,17 +2242,18 @@ static int snp_launch_finish(struct kvm *kvm, struct kvm_sev_cmd *argp)
>  
>  		data->id_block_en = 1;
>  		data->id_block_paddr = __sme_pa(id_block);
> -	}
>  
> -	if (params.auth_key_en) {
>  		id_auth = psp_copy_user_blob(params.id_auth_uaddr, KVM_SEV_SNP_ID_AUTH_SIZE);
>  		if (IS_ERR(id_auth)) {
>  			ret = PTR_ERR(id_auth);
>  			goto e_free_id_block;
>  		}
>  
> -		data->auth_key_en = 1;
>  		data->id_auth_paddr = __sme_pa(id_auth);
> +
> +		if (params.auth_key_en) {

While I'm here though...  Single line if-statements don't need curly braces.

> +			data->auth_key_en = 1;
> +		}
>  	}
>  
>  	data->gctx_paddr = __psp_pa(sev->snp_context);
> -- 
> 2.37.1
> 
