Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF9D80C
	for <linux-coco@lists.linux.dev>; Thu, 25 Apr 2024 00:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714004240; cv=none; b=CrBUdGltxBuSGVheB2+jTG1XI/vvyJnjynkctZEUhAl/ciyAeF5RAZajhFZTfZPxm/YOxbfEIOry1XUF2IwP0/cvrpPBVUho6O7HJJozWE1ELmNAS1uO9DxGvC8XOM2LwShRslTDSGtw7G7oE20kSnmfw20EuuqqOLT22bUMBHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714004240; c=relaxed/simple;
	bh=y194H3ql9IsOPzk1sZAi+84lwfCHJUjSzRUSPix0sVE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dQqD7PU17sfP0e7mic3zTxGdcEYej0T8G+B0QqXGT2ZReSgbufFVE56TKxfcxthnQSdjlkW835RkDjrpq1SZ/p7cihgQF5K7hZYHj8QNE9m24EHGFOndTJfXvnkK0Fdz0JWG5gVQ7+fGdgfw+EYCcgWdIXLpsDWAXjE/qAERB20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CExp4jBh; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CExp4jBh"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-de465062289so937009276.2
        for <linux-coco@lists.linux.dev>; Wed, 24 Apr 2024 17:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714004238; x=1714609038; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JTJ1EUj9mJco0oYfbV1dH143iLNodHjs8SX3c6d486Q=;
        b=CExp4jBhQmoWd+9jt3ezPB6PT5Sufg+/rB7LT3rCzdhAFDM+ouMF6P+ay0aCqdTgzV
         eSAJ03bnFqUKAzBFN077axYCFm2kY72QN7v3YpMhFHse2TQmJGNzrbImflLhd7CzkJ3R
         V9xF89OQ0OWzZncw6iHjvQMjo2K4zRyZnJpE9ECh/UM+I8cXP/j7LiTFDF+cr5Z73yGJ
         +3NvM9k147sZuqCHhLBmBGIVUvU8uRs7qZow6+ZfTPmw3sznnr5jh2zxMoe9ezEO/qzb
         PXWye7Oi34rUC/DKjGNOzn2rxMJ4wcBPRXUU20vXp+pM2YxlcqXH0qYCRubRAP8oyjAV
         3atA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714004238; x=1714609038;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JTJ1EUj9mJco0oYfbV1dH143iLNodHjs8SX3c6d486Q=;
        b=lp4Lbf38UuMmA42zM63poAVKDQQpEZSMXbkMo8vPtJyqL+hOdwqtDuXIf3Vy92i4wV
         PA2gLQ2Y/BXfH36VomNp436BuF4RArwGEHv3c36G+YKXI36WBPbo9GiFyEkI0nWE1rSv
         QyBp44rDNjXDB70XqWyEyDLcNEZakMUXAgkiDu/gs1Fy7BrX68cuatnrxD1LpXdkp69/
         l+KLzeaF+hVQOgKso+xyA0H8qq0LwP6Rfn3P/Bj4inqHnjjARffoLCmmFyxJq2fPUTzi
         khEnLHNRsgS6r+LSZy8QUAkfKG6/Sc/iPUOn2dOxGlN+FS80sUnOPvOHFlTyIjH1WXJd
         HfTg==
X-Forwarded-Encrypted: i=1; AJvYcCV6zxk+dcY5ilByJCpn9seUd1IVptXgDf8A2F3bTv4/o69XC3AdWVxKdqBZA8b4dogqJNSDa2MObuBatjscggkgkBi4LoIgzff0xA==
X-Gm-Message-State: AOJu0YzjKT1ZvOu7XHEsRC1g2jCmz7F5FpEooRQK+YKURyHh20SN/Evl
	UhRn2zK3BeT3/NemCQ1YqQLsmYyNMsQCyIPFFZhv/ZrOYDVyxa3Ic6reQLF/dZ1JUqappFWsELi
	hzw==
X-Google-Smtp-Source: AGHT+IF06EpTOwvZeQGKlqPQtXFzYGfZPqUfmBFZuyaYdLAzcsdi+7awfJdAqckqz+IcAQhBBvcZ3k/AgAM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1205:b0:de5:2325:72ac with SMTP id
 s5-20020a056902120500b00de5232572acmr1331874ybu.6.1714004238029; Wed, 24 Apr
 2024 17:17:18 -0700 (PDT)
Date: Wed, 24 Apr 2024 17:17:16 -0700
In-Reply-To: <20240421180122.1650812-18-michael.roth@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240421180122.1650812-1-michael.roth@amd.com> <20240421180122.1650812-18-michael.roth@amd.com>
Message-ID: <ZimhDMwAif-KIxNs@google.com>
Subject: Re: [PATCH v14 17/22] KVM: SEV: Avoid WBINVD for HVA-based MMU
 notifications for SNP
From: Sean Christopherson <seanjc@google.com>
To: Michael Roth <michael.roth@amd.com>
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-mm@kvack.org, 
	linux-crypto@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, jroedel@suse.de, 
	thomas.lendacky@amd.com, hpa@zytor.com, ardb@kernel.org, pbonzini@redhat.com, 
	vkuznets@redhat.com, jmattson@google.com, luto@kernel.org, 
	dave.hansen@linux.intel.com, slp@redhat.com, pgonda@google.com, 
	peterz@infradead.org, srinivas.pandruvada@linux.intel.com, 
	rientjes@google.com, dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, 
	vbabka@suse.cz, kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, alpergun@google.com, 
	jarkko@kernel.org, ashish.kalra@amd.com, nikunj.dadhania@amd.com, 
	pankaj.gupta@amd.com, liam.merwick@oracle.com
Content-Type: text/plain; charset="us-ascii"

On Sun, Apr 21, 2024, Michael Roth wrote:
> From: Ashish Kalra <ashish.kalra@amd.com>
> 
> With SNP/guest_memfd, private/encrypted memory should not be mappable,
> and MMU notifications for HVA-mapped memory will only be relevant to
> unencrypted guest memory. Therefore, the rationale behind issuing a
> wbinvd_on_all_cpus() in sev_guest_memory_reclaimed() should not apply
> for SNP guests and can be ignored.
> 
> Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> [mdr: Add some clarifications in commit]
> Signed-off-by: Michael Roth <michael.roth@amd.com>
> ---
>  arch/x86/kvm/svm/sev.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> index 243369e302f4..cf00a811aca5 100644
> --- a/arch/x86/kvm/svm/sev.c
> +++ b/arch/x86/kvm/svm/sev.c
> @@ -3042,7 +3042,14 @@ static void sev_flush_encrypted_page(struct kvm_vcpu *vcpu, void *va)
>  
>  void sev_guest_memory_reclaimed(struct kvm *kvm)
>  {
> -	if (!sev_guest(kvm))
> +	/*
> +	 * With SNP+gmem, private/encrypted memory should be

Not should, *is*.

> +	 * unreachable via the hva-based mmu notifiers. Additionally,
> +	 * for shared->private translations, H/W coherency will ensure
> +	 * first guest access to the page would clear out any existing
> +	 * dirty copies of that cacheline.

I don't see how this second part is relevant.

> +	 */
> +	if (!sev_guest(kvm) || sev_snp_guest(kvm))
>  		return;
>  
>  	wbinvd_on_all_cpus();
> -- 
> 2.25.1
> 
