Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED2C47F47
	for <linux-coco@lists.linux.dev>; Sat, 30 Mar 2024 21:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711834544; cv=none; b=gbF8vXcOEY5xMMXOwsUxExg1GP76PhOnW9Ui1S1zABPVqg6xOUYIA4gB6uZQLQPS5D0wYv66T0VMyirDa4imAO7fdAnUMmIx7ToIt4UOHtKj5n8SsOof/FxSCfsGR1px3ucSIWTL4VKJI3d0psrF/1erWzk59EJdTEbc2D1Hhv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711834544; c=relaxed/simple;
	bh=A/4nTvH3zcKKDjwq9z7ISuECCM1K8A3A6bBgBipegtg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eFNgdjaR4J4Uoz+I3mgxLCqDUhmelqAAHz0lyzdxYao424xVWR2Nhu0tjv7RzRU8+BurJQYRKYCRtuYssoMOcH5fLyOkLqidZ7AIYF220I4hAc3/JVLff8IYWvxugAc9q4yrqtBIOvmWRLQaDqhCFqYWv+xjN9Pyjs5/yvVQ9xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JSkQ4rEh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JSkQ4rEh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711834541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=k6nhJ/n2fVMLTJ5orSzZrSN05UZkFdn1WgbErq3l2Pk=;
	b=JSkQ4rEhAmsVeZHuSYL5XgrgNAt13SHnq30WYpbBo6nFSIhiqf0vtKADsEKaBU6OpGVLpQ
	QDX2PzilH9CaTqvHEj9l8ryQdEGf/Tgw6oCc+JpP/bBlFa90eiL40fMPrYKiSpY28VeuVr
	I/R0WttkS5b3uVoyvz/AgBrsOKNpSuI=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-75-yPJa5AWCMTq1IhM3KQ4SVg-1; Sat, 30 Mar 2024 17:35:39 -0400
X-MC-Unique: yPJa5AWCMTq1IhM3KQ4SVg-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-50e91f9d422so2894475e87.2
        for <linux-coco@lists.linux.dev>; Sat, 30 Mar 2024 14:35:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711834538; x=1712439338;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k6nhJ/n2fVMLTJ5orSzZrSN05UZkFdn1WgbErq3l2Pk=;
        b=e+KnUoEmDREmn0eVuDF5vxPDiGI4XwXjtzscJKWPIIZVFDhv/JGqkY71OVWnHdfCDT
         KYqtHzLrQuPvCfOAuigglFBDHScO8UvUcY5NOCVywksj4mpm4Cl0F9qNNJWIpxDIUnEs
         IjwU5/FfAJGKf1/L0wx5dB3Nn8cWMmY2g9FYcmQicjSc0O6OmHipTiGJpUTWE93dW/F4
         UMBHHHn6G+9opU4+ukSluMif4zmBtjiPqte9B4Re3Hnx0OXQHOCX9C9Fn3q28D7xhqGA
         lUVyQRYvIebB1nMLJNbPMMPTl4bTtb7Rj5/13OgTKyFADFLP4XHNEY3OLhVXX6WEZQt8
         T+uw==
X-Gm-Message-State: AOJu0YzjNz0vbDk0jRaksNtVZGwxSA/5vdYtSg18HN1vTyo1TOLV5RNk
	QTNk7NBoYkPuoiMc/jvLDVTW/TT4oqOqjRc9XUadfl2zhfqvSaXSNh6N1lr8NvCEjDMxRalTh/Q
	DwnVkaul9SNPUkbcObecFHZg46NiLw4YwfwQ10wQ6EnMA4j7/NGZtjmW/c9w=
X-Received: by 2002:a19:2d18:0:b0:513:b062:98c4 with SMTP id k24-20020a192d18000000b00513b06298c4mr3643254lfj.11.1711834538174;
        Sat, 30 Mar 2024 14:35:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5PGmEGHf24nUfF7B7vuwJRBVN0rKW1MZiU9RQdC6MVZb3TnEUgyIIaZghldmm9GaQfOSwZw==
X-Received: by 2002:a19:2d18:0:b0:513:b062:98c4 with SMTP id k24-20020a192d18000000b00513b06298c4mr3643226lfj.11.1711834537752;
        Sat, 30 Mar 2024 14:35:37 -0700 (PDT)
Received: from [192.168.10.4] ([151.95.49.219])
        by smtp.googlemail.com with ESMTPSA id w4-20020a1709062f8400b00a4e07f8b6bfsm3445434eji.59.2024.03.30.14.35.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Mar 2024 14:35:37 -0700 (PDT)
Message-ID: <00800f4b-5403-4416-b984-12b207362a19@redhat.com>
Date: Sat, 30 Mar 2024 22:35:33 +0100
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 24/29] KVM: SEV: Avoid WBINVD for HVA-based MMU
 notifications for SNP
To: Michael Roth <michael.roth@amd.com>, kvm@vger.kernel.org
Cc: linux-coco@lists.linux.dev, linux-mm@kvack.org,
 linux-crypto@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 tglx@linutronix.de, mingo@redhat.com, jroedel@suse.de,
 thomas.lendacky@amd.com, hpa@zytor.com, ardb@kernel.org, seanjc@google.com,
 vkuznets@redhat.com, jmattson@google.com, luto@kernel.org,
 dave.hansen@linux.intel.com, slp@redhat.com, pgonda@google.com,
 peterz@infradead.org, srinivas.pandruvada@linux.intel.com,
 rientjes@google.com, dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de,
 vbabka@suse.cz, kirill@shutemov.name, ak@linux.intel.com,
 tony.luck@intel.com, sathyanarayanan.kuppuswamy@linux.intel.com,
 alpergun@google.com, jarkko@kernel.org, ashish.kalra@amd.com,
 nikunj.dadhania@amd.com, pankaj.gupta@amd.com, liam.merwick@oracle.com
References: <20240329225835.400662-1-michael.roth@amd.com>
 <20240329225835.400662-25-michael.roth@amd.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20240329225835.400662-25-michael.roth@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/29/24 23:58, Michael Roth wrote:
> From: Ashish Kalra <ashish.kalra@amd.com>
> 
> With SNP/guest_memfd, private/encrypted memory should not be mappable,
> and MMU notifications for HVA-mapped memory will only be relevant to
> unencrypted guest memory. Therefore, the rationale behind issuing a
> wbinvd_on_all_cpus() in sev_guest_memory_reclaimed() should not apply
> for SNP guests and can be ignored.
> 
> Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
> [mdr: Add some clarifications in commit]
> Signed-off-by: Michael Roth <michael.roth@amd.com>

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

> ---
>   arch/x86/kvm/svm/sev.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> index 31f6f4786503..3e8de7cb3c89 100644
> --- a/arch/x86/kvm/svm/sev.c
> +++ b/arch/x86/kvm/svm/sev.c
> @@ -2975,7 +2975,14 @@ static void sev_flush_encrypted_page(struct kvm_vcpu *vcpu, void *va)
>   
>   void sev_guest_memory_reclaimed(struct kvm *kvm)
>   {
> -	if (!sev_guest(kvm))
> +	/*
> +	 * With SNP+gmem, private/encrypted memory should be
> +	 * unreachable via the hva-based mmu notifiers. Additionally,
> +	 * for shared->private translations, H/W coherency will ensure
> +	 * first guest access to the page would clear out any existing
> +	 * dirty copies of that cacheline.
> +	 */
> +	if (!sev_guest(kvm) || sev_snp_guest(kvm))
>   		return;
>   
>   	wbinvd_on_all_cpus();

