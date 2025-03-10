Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF6A29A2
	for <linux-coco@lists.linux.dev>; Mon, 10 Mar 2025 12:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741608814; cv=none; b=iNnpBbIq7SfU8eGg72X9IDhJHZ7O2fT3glNKv7yiXs2BX1pWoQXXxho69rrziwvDs+rRZh0A5XwrQWfyjvk0mfpOXKFMInG8cNfntHXKjMD2RcuByHsp9H3gn2uqGUqOiKXJFr9zV1mgGKLz0rACXH+DV/XJh70q5eqDOgBKj3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741608814; c=relaxed/simple;
	bh=XUQ74N8CFAQMmZBMklSCKl3+y2dbF8sPEjzdYlp1I3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ALmu0ToAtSnYwJ1aV+G4HSghKs+zbaJ+Z1OtBM/EB5nqamQFZGfq2WYNg8YlZ6OhWrTU6Mtf0aFJUXw/A0kn1UO7F4AFCg0ICGnDxZbPMxv6Lflgd4IYa1hx/TeBia2vX4lnxazz1y7dVIU+rrsx6Ve9Wt6x3H9gBuK5bSyNb8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ioKTIbWe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ioKTIbWe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741608810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sGViJXCclzx/2EWYRBSu51fQCiFZyNMwoJLCZOnspZQ=;
	b=ioKTIbWeDV7ILNC7taHRoE56/mfJC8YtNPK/U1pe3xcPwhCaPe1lnXiDrFdbGl1XzXIeuF
	Aw/6hTTZgJpqJIeLsCkRherZGvEZYz46++UdXG8/Pudw4eDsF/l/3schczuUXGsbU+ieEb
	zrgHEvx4c9FnaZmeRcRn4kwMGpLzgGs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-512-_Z0Z2GTOOvyskHBEnvbC_Q-1; Mon, 10 Mar 2025 08:13:29 -0400
X-MC-Unique: _Z0Z2GTOOvyskHBEnvbC_Q-1
X-Mimecast-MFC-AGG-ID: _Z0Z2GTOOvyskHBEnvbC_Q_1741608808
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-391425471ddso842653f8f.0
        for <linux-coco@lists.linux.dev>; Mon, 10 Mar 2025 05:13:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741608808; x=1742213608;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sGViJXCclzx/2EWYRBSu51fQCiFZyNMwoJLCZOnspZQ=;
        b=FgjvmYt25Nz+4rep79en0c8imnhHri52y1weoRWVotp11yWYy0uxWR/CQue1aTMzwZ
         KiboCK22BM+faWjoExcqP6oGXNnN//QjfkOtMlBzxTLIKyhN9JzVuiXnMTyREbKDFnQU
         Gtt8TyAep9TnHasxBF0EEQUgdTWoSYpy0s3+Htm1LOi/vGrYq6Ngc8zKyrdUBMFtCwhx
         L6wqnOn0i8je53/GcCjNI8SrMy+BW7+D2TtralJh1G+a2PRXDJp0SBDO4HArfeNMH2Sg
         1xmPMk2tBooJ4eJVCY5iAJKS3CE1wDBO1IPJK4iEPt/TT+/OjfR+2bZacZ13ZvxbHPt/
         nxAA==
X-Forwarded-Encrypted: i=1; AJvYcCUrhpKLg0AQkccv45+uHkTQzrEH0l684VEjD+yyxenyAoiBS5vjesoPIaTyz2H8HHqC6+0XuuKtjDx2@lists.linux.dev
X-Gm-Message-State: AOJu0YyVUny9gZBO5r+NCcYPrvYJks9Zdw4fkDPEnADGRyih/PZl5fbd
	oTrzwkMDzvsTIsYzs2iXVMfXr2syY9OxFAM5kIvHrE0CLOI0RYw64p3heCyd6pTTb8wdv1aB1m8
	PVILNiWrG4yhMMFQ0Xsu+5zIeTEIXIIW3rM1RDNlf052/hkT7V+eb1SxPqlo=
X-Gm-Gg: ASbGnctw4S6lX+1eaNnXy/HgQsSAonqgn2A2EPqkPoYueLiq5Sc0Wihbvsx7PSuuV1j
	74XCjBMLcWU2S2oUDLiF6GeAEX/vfC318SfHFMixOt/5qdIng2iMqVO89xSm4JuFgVq1le3lH3q
	DKKD0rtK0N+XpqRfYwUq4movImBjKKDZzqfqMjUr0N9YT47bZqibp95PM33TUsnbxn9gAJIenVR
	Bvub9R/2u2gHE3pGSBPJRUgL4mRzUNPWIcjeSSeXbLpb/CmyFQ28m8K0CKWagjeVU+irLAc7IB+
	h/wDSVu8/QcVTKk887iLuaejeFIke7VcHhWOimMF8Bmq29Q3uZnvE1RF5tEmahwM
X-Received: by 2002:a5d:6d0c:0:b0:390:de33:b0ef with SMTP id ffacd0b85a97d-39132d7084emr11040350f8f.30.1741608807829;
        Mon, 10 Mar 2025 05:13:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrpAzNy6sSH4YOG1+5l942/ORd7aa1SNvDl7U7GiW1x9GoWjA6Xlf8uANpk8LgTiYslFPSmg==
X-Received: by 2002:a5d:6d0c:0:b0:390:de33:b0ef with SMTP id ffacd0b85a97d-39132d7084emr11040296f8f.30.1741608807285;
        Mon, 10 Mar 2025 05:13:27 -0700 (PDT)
Received: from sgarzare-redhat (host-79-46-200-29.retail.telecomitalia.it. [79.46.200.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c103035sm14450166f8f.88.2025.03.10.05.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 05:13:26 -0700 (PDT)
Date: Mon, 10 Mar 2025 13:13:22 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Claudio Carvalho <cclaudio@linux.ibm.com>, 
	Peter Huewe <peterhuewe@gmx.de>, x86@kernel.org, Dov Murik <dovmurik@linux.ibm.com>, 
	linux-coco@lists.linux.dev, Dionna Glaze <dionnaglaze@google.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>, 
	Jason Gunthorpe <jgg@ziepe.ca>, linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dave Hansen <dave.hansen@linux.intel.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [RFC PATCH v2 1/6] x86/sev: add SVSM call macros for the vTPM
 protocol
Message-ID: <5zulxqr6l4xivnbdgal6nyz5c6x2mtqbkvhfx565tu6gmxxrgq@wpklze3745wn>
References: <20250228170720.144739-1-sgarzare@redhat.com>
 <20250228170720.144739-2-sgarzare@redhat.com>
 <20250310110834.GEZ87IMgB_I86-3u3l@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250310110834.GEZ87IMgB_I86-3u3l@fat_crate.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: R7_oujQRpPAcMbvv9J_Lx2aDRbgVpD-Sjg7gLOPfWls_1741608808
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Mon, Mar 10, 2025 at 12:08:34PM +0100, Borislav Petkov wrote:
>On Fri, Feb 28, 2025 at 06:07:15PM +0100, Stefano Garzarella wrote:
>> Add macros for SVSM_VTPM_QUERY and SVSM_VTPM_CMD calls as defined
>> in the "Secure VM Service Module for SEV-SNP Guests"
>> Publication # 58019 Revision: 1.00
>>
>> Link: https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/specifications/58019.pdf
>
>Those URLs are unstable - simply naming the document properly in the commit
>message so that a search engine can find it is enough.

Ack, I'll do it all over the place in this series (commit descriptions, 
code comment blocks, etc.).

>
>> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>> ---
>>  arch/x86/include/asm/sev.h | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
>> index 1581246491b5..f6ebf4492606 100644
>> --- a/arch/x86/include/asm/sev.h
>> +++ b/arch/x86/include/asm/sev.h
>> @@ -384,6 +384,10 @@ struct svsm_call {
>>  #define SVSM_ATTEST_SERVICES		0
>>  #define SVSM_ATTEST_SINGLE_SERVICE	1
>>
>> +#define SVSM_VTPM_CALL(x)		((2ULL << 32) | (x))
>> +#define SVSM_VTPM_QUERY			0
>> +#define SVSM_VTPM_CMD			1
>> +
>>  #ifdef CONFIG_AMD_MEM_ENCRYPT
>>
>>  extern u8 snp_vmpl;
>> --
>
>Merge this patch with the patch where those are used - no need for a separate
>patch.

Yeah, it is left over from v1 when I had added this patch over James' 
patches, but now I agree that it no longer makes sense since I have 
reworked almost every patch in this series. I'm going to incorporate 
them!

Thanks,
Stefano

