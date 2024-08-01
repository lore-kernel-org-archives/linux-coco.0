Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050D03A8F7
	for <linux-coco@lists.linux.dev>; Thu,  1 Aug 2024 18:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722536140; cv=none; b=b0PKNpeq9p0/tt5yLsy/FgBSl5Tktxzvk6lenBGeoPmTa20bePfC4S8M+g2/2Qzc5RitCqAzht+dhxzizni82WzT6QU+VKQNcwNoIE/9v7IPNW2MML1s3Ue2j/Old2L84DiKJZNPcnhoDlPgCT2Py3aWjUYiD2+o93LIRaXSrZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722536140; c=relaxed/simple;
	bh=SUfyZKUo0IFCp9KDhlQwd3l6b/z5WFA0jaDZUeAQ/tg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TyJHyY4d4Q/dbbOeRwu/OqDPVQIt155FZLAC+Kdy0y0nnKIl2E/KB+msglyETP2uGXu9nuN4EX5ITHxDVlBVEplUdHgm7FtczOHtv9fpHEPUHE00pP5I0YDOdmkh2iZa9/MaODSugIwQ673TqrVstYWVbWjF+8ZeYcCjy8W/834=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FRyqCXED; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FRyqCXED"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722536138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UaZOROEvjpdbqu1dopLC2Lkrj6Dr9/VPZUA+DhTI8M4=;
	b=FRyqCXED3g4TlgEg3hUZE1QCOsfddKzdRZ04Ep79zo/pCyYmE9wTgI7PWu14lEW5pg/UDi
	ixuZf+6Hr0M620wPFZJU71WV5oF92ZG3aYStlPIgQsGIbsh+fus10adx7npG8K5RCrVgHZ
	nU2W1I4tZzscMe86gun58HCikRsENAM=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-5Dr9MIQiPqGZl2XxO5LZAg-1; Thu, 01 Aug 2024 14:15:36 -0400
X-MC-Unique: 5Dr9MIQiPqGZl2XxO5LZAg-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-52efd629749so9139482e87.2
        for <linux-coco@lists.linux.dev>; Thu, 01 Aug 2024 11:15:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722536135; x=1723140935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UaZOROEvjpdbqu1dopLC2Lkrj6Dr9/VPZUA+DhTI8M4=;
        b=J0Buy2jZvJ5h9LXcpjxvA3R/ViQbfdm3eHE4GAAY6bxeOEIShZ4vgFOkr1azGSs/e/
         T83y1+Kp6evGyo2aCJifTHn25hhvVmDd81EosNxex8LLLpaMd7YjWsxjHTGZswkgtpT/
         Moxa8P4i5QvpEFn26/x557HjD5RQMbELqXlSz3NB1JerJu72ItYagNsY3mNlSGUobHWc
         W6Clg71dVsci/qRjpoZXVQqG80h2ccTK/qgjrHUL7/SC8fGOQFVmsATK0zZzy5hk8iBi
         IkqxAIh8aLFInQ2qRh3oQW1WWHSwOr4iJF/9pUKI/8PMhASsbY9AADVUDxOh5FHvYhzi
         PeBg==
X-Forwarded-Encrypted: i=1; AJvYcCVhNJCfCjvSABH2y8jxYLdJlP7PxBtKi54EZVQ7DVkYOE/QOmf6aE4bRsSb4fuFt+wKgpc4q+sCzFmf9s8z3ZyKnZ5iyG4x/61kOA==
X-Gm-Message-State: AOJu0YwAYmvWG8FhoaRb5uc+dLvPx7Srqo9iR/EmlU2s/zXOToJJorrZ
	rFxElY8SLVJ2j22aP2EcwLnTQAUYnZ4DFkRKE84fMGh54lMO5LzRDmo70hJ1VXQ68yosvg6KkeD
	14pFQu1MEWORaV09nVCAXh4cy3oR2dJXKSx8KKi3Oxw7rIubFJPwK0prCUB8bYsvek+Qs7xP8uW
	HbzYy4x0SDSvqe6JZT0MdYFQMWLG0hPzKXnw==
X-Received: by 2002:a2e:874b:0:b0:2ef:29b7:18a7 with SMTP id 38308e7fff4ca-2f15ab0c224mr8027151fa.37.1722536134887;
        Thu, 01 Aug 2024 11:15:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEW/QthBnS2n2JpnEiBTz7UDN3Rn0ZpSHt4zKv0qUnmJfmwCaik8m91bLxVWR1bJoJl2RmwJ89dnkiDtZdyq7c=
X-Received: by 2002:a2e:874b:0:b0:2ef:29b7:18a7 with SMTP id
 38308e7fff4ca-2f15ab0c224mr8026601fa.37.1722536134319; Thu, 01 Aug 2024
 11:15:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240501085210.2213060-3-michael.roth@amd.com> <20240801173955.1975034-1-ackerleytng@google.com>
In-Reply-To: <20240801173955.1975034-1-ackerleytng@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 1 Aug 2024 20:15:22 +0200
Message-ID: <CABgObfZbS7LsKM_w2ZSpb82oBAHF=pJfVJ+45k7=vVVWHK5Y6A@mail.gmail.com>
Subject: Re: [PATCH] Fixes: f32fb32820b1 ("KVM: x86: Add hook for determining
 max NPT mapping level")
To: Ackerley Tng <ackerleytng@google.com>
Cc: michael.roth@amd.com, ak@linux.intel.com, alpergun@google.com, 
	ardb@kernel.org, ashish.kalra@amd.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, dovmurik@linux.ibm.com, hpa@zytor.com, 
	jarkko@kernel.org, jmattson@google.com, vannapurve@google.com, 
	erdemaktas@google.com, jroedel@suse.de, kirill@shutemov.name, 
	kvm@vger.kernel.org, liam.merwick@oracle.com, linux-coco@lists.linux.dev, 
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, luto@kernel.org, mingo@redhat.com, 
	nikunj.dadhania@amd.com, pankaj.gupta@amd.com, peterz@infradead.org, 
	pgonda@google.com, rientjes@google.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, seanjc@google.com, slp@redhat.com, 
	srinivas.pandruvada@linux.intel.com, tglx@linutronix.de, 
	thomas.lendacky@amd.com, tobin@ibm.com, tony.luck@intel.com, vbabka@suse.cz, 
	vkuznets@redhat.com, x86@kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 1, 2024 at 7:40=E2=80=AFPM Ackerley Tng <ackerleytng@google.com=
> wrote:
>
> The `if (req_max_level)` test was meant ignore req_max_level if
> PG_LEVEL_NONE was returned. Hence, this function should return
> max_level instead of the ignored req_max_level.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Change-Id: I403898aacc379ed98ba5caa41c9f1c52f277adc2

It's worth pointing out that this is only a latent issue for now,
since guest_memfd does not support large pages ( __kvm_gmem_get_pfn
always returns 0).

Queued with a small note in the commit message and fixed subject.

Thanks,

Paolo


> ---
>  arch/x86/kvm/mmu/mmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index 901be9e420a4..e6b73774645d 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -4335,7 +4335,7 @@ static u8 kvm_max_private_mapping_level(struct kvm =
*kvm, kvm_pfn_t pfn,
>         if (req_max_level)
>                 max_level =3D min(max_level, req_max_level);
>
> -       return req_max_level;
> +       return max_level;
>  }
>
>  static int kvm_faultin_pfn_private(struct kvm_vcpu *vcpu,
> --
> 2.46.0.rc2.264.g509ed76dc8-goog
>

