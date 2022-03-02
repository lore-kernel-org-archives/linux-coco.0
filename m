Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7857A
	for <linux-coco@lists.linux.dev>; Wed,  2 Mar 2022 16:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646237387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/2VVs+jpaNG/J5zC1zTP1UGv1gQAxskIJSue9vwi7bY=;
	b=egXVIdzuzSV8ONfX+hTFe9p9K/X+y+HKjUHmA4NkGxfUwXkDLfbfKig+GZlz437TN+a19T
	kcp2a3KNhbNx5KlaHNdKkyeUcCr8e5BGEWBm0X5S9nIaGnkm+T4j9m+jyWTOH5H3HAGuwy
	PR7+idmuECLHOuOoXr/iCOc9n0Voh7g=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-137-SUpX-ZSNNaG5vvlWl3EX3w-1; Wed, 02 Mar 2022 11:09:46 -0500
X-MC-Unique: SUpX-ZSNNaG5vvlWl3EX3w-1
Received: by mail-wr1-f71.google.com with SMTP id f14-20020adfc98e000000b001e8593b40b0so800567wrh.14
        for <linux-coco@lists.linux.dev>; Wed, 02 Mar 2022 08:09:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/2VVs+jpaNG/J5zC1zTP1UGv1gQAxskIJSue9vwi7bY=;
        b=ZvmWRxb09oqAKiFQ8f3BcE4ETo3FW/F9r1Cm4IYNGSlwZUV37G1nQ0cHptT7dmQaRC
         TwCMDoI7hSt03lT8rBES0DFx+R7XnK+PVv/rzoKNwzXxFaDrHkG5bIwiCtPZcri9ARbI
         YbNIrTS7JXo1vqq85yYNF061oOF98Y0ruJiwebUBeHON6Uv/IUJobltj/xiiJG/Wbh3y
         z34UVh6aILJF1EqDmxuCFqVOmbqzmgRShNEDx2XL8AIWfvVzeleTQxWJuFcyWZdR3lgo
         b7X381D8uZY2XCRmv6sosU5PFwuWoVzQEpdT0Nsv2nhRhmef9aBaw8Mcgqh54yd3l1Tu
         StjA==
X-Gm-Message-State: AOAM530Masa15BvA4gfOTtdVBdOXbcQHnNai+fdDclzOYCx0K4Fue4xH
	7dfwep+pZdyEDEDndb392D5c+Tb90zekY7tmPcazL5EOMeW/KxZHRD5cV7rl8AGeK8NzVmd4ndf
	OXLVqsrECcL88eQ7yGIaRLA==
X-Received: by 2002:a5d:484c:0:b0:1ef:c216:12e3 with SMTP id n12-20020a5d484c000000b001efc21612e3mr11900854wrs.13.1646237384994;
        Wed, 02 Mar 2022 08:09:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw90ZgDzHip3WR0j/kz08UsT1FI/BlJOLZiwaYx0i4o5rAuxPsiAmGZ5mdLez3oGCaiL2Thgw==
X-Received: by 2002:a5d:484c:0:b0:1ef:c216:12e3 with SMTP id n12-20020a5d484c000000b001efc21612e3mr11900830wrs.13.1646237384734;
        Wed, 02 Mar 2022 08:09:44 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e? ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
        by smtp.googlemail.com with ESMTPSA id r12-20020a05600c2c4c00b003816932de9csm6125030wmg.24.2022.03.02.08.09.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Mar 2022 08:09:44 -0800 (PST)
Message-ID: <519f5e8e-18d1-43ac-ef90-0320d21c3a55@redhat.com>
Date: Wed, 2 Mar 2022 17:09:34 +0100
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v11 00/45] Add AMD Secure Nested Paging (SEV-SNP) Guest
 Support
To: Borislav Petkov <bp@alien8.de>
Cc: Brijesh Singh <brijesh.singh@amd.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-coco@lists.linux.dev, linux-mm@kvack.org,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Joerg Roedel <jroedel@suse.de>, Tom Lendacky <thomas.lendacky@amd.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>,
 Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>,
 Andy Lutomirski <luto@kernel.org>, Dave Hansen
 <dave.hansen@linux.intel.com>, Sergio Lopez <slp@redhat.com>,
 Peter Gonda <pgonda@google.com>, Peter Zijlstra <peterz@infradead.org>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 David Rientjes <rientjes@google.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@ibm.com>, Michael Roth <michael.roth@amd.com>,
 Vlastimil Babka <vbabka@suse.cz>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Andi Kleen <ak@linux.intel.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, brijesh.ksingh@gmail.com,
 tony.luck@intel.com, marcorr@google.com,
 sathyanarayanan.kuppuswamy@linux.intel.com
References: <20220224165625.2175020-1-brijesh.singh@amd.com>
 <Yh99pBI/RwZY1yf7@nazgul.tnic>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Yh99pBI/RwZY1yf7@nazgul.tnic>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/2/22 15:22, Borislav Petkov wrote:
> On Thu, Feb 24, 2022 at 10:55:40AM -0600, Brijesh Singh wrote:
>> This part of Secure Encrypted Paging (SEV-SNP) series focuses on the changes
>> required in a guest OS for SEV-SNP support.
> 
> So the first 4 are KVM material.
> 
> Paolo, what's the story here, are you gonna take them and give me an
> immutable branch or do you have another idea?

Sure: https://git.kernel.org/pub/scm/virt/kvm/kvm.git, branch svm-for-snp.

$ git log -4 --oneline --reverse
3c95d3fab229 KVM: SVM: Define sev_features and vmpl field in the VMSA
0c86f9cf27f7 KVM: SVM: Create a separate mapping for the SEV-ES save area
c5e0ec4c742d KVM: SVM: Create a separate mapping for the GHCB save area
88c955d1fc93 (HEAD -> kvm/svm-for-snp) KVM: SVM: Update the SEV-ES save area mapping

Paolo

