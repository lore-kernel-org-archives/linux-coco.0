Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D26FA4C
	for <linux-coco@lists.linux.dev>; Wed,  1 Mar 2023 21:23:10 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id g17so19514536lfv.4
        for <linux-coco@lists.linux.dev>; Wed, 01 Mar 2023 13:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677705788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:date:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5FeJ+IDtaGU0Dng3JPzlo8N148iZPjSnDaT2NDjs7iw=;
        b=U8CpE6oQW0T0yL/b9SkOw8+im0wm0VFjDpBzKhqnbc90OvihHMA8b3Swuuy9QqpKMe
         M+zFCU5cpADOmoJbYfb0etx9J0WIpBgFCtv13HBtqqQWPUMRzvD540wG5oR1npPqHhcs
         XHdM9ObzYlw1GwwKb7RGDEgk3dCUQEgEg9hPh05KETDEJcy5nuIlhCM5Lvuof3p6zEMM
         NO6CZHki9sKwqzWnZRUdOQT9s+Pa0Atf+qamboT7QHXS+kvTpz7o11xBU8WEkEMRHhns
         OdzCe5cUufbtOfHlr/uaxn2eo3wfc57z+O/pojBy519Ra4o7lNhCJF1hAKcXPmnI3qrF
         k7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677705788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5FeJ+IDtaGU0Dng3JPzlo8N148iZPjSnDaT2NDjs7iw=;
        b=JRS0qLeeEn6LQ6A1xy/A/fLrllEVR2B2BohX77RX5jLVW3HTvB96OQ0q1WM2wFZOGJ
         6xEVDsSSNMhcJNxnwTmc8FFYEpWIeYqsiJwObnpwJzvys7oZAbZyG8tYv8anlXIlv1nR
         RMiO7gBZREnmviEJIHUTyxN005yot2k+6Hakan6o86g5eYGGsF6uF+q+KvgRLSfP+2TF
         PBkz2qsr4Zk5S1PSZIgfdCJfvqnrmcYU7nIH4LzNMIl4tIAxyNYcQ5DviZoifbHZYwQa
         AAZG6zMRUh8TUEtxJ7ZD/9DH/FWZwsIsOcWUBmSbKAAgzSpJQF3kIVl4Xuw4RiJsUag0
         J5HQ==
X-Gm-Message-State: AO0yUKWoRJ6erTSNlyY3ivQBgTdOB6P3ObQh1V7FhZK4i4WrJ0d4LvNx
	HSkoWmsKJJPQPKq0XTXOicA=
X-Google-Smtp-Source: AK7set9Husvr/raZBgcJeLI0L1kUHYIjgMkrgLJmOKKElIcO7WhwF5Z9WCFNJJAEq103LkvXE98QNg==
X-Received: by 2002:ac2:44a9:0:b0:4d2:c70a:fe0a with SMTP id c9-20020ac244a9000000b004d2c70afe0amr1752508lfm.2.1677705788430;
        Wed, 01 Mar 2023 13:23:08 -0800 (PST)
Received: from localhost (88-115-161-74.elisa-laajakaista.fi. [88.115.161.74])
        by smtp.gmail.com with ESMTPSA id p3-20020a19f003000000b004db2bda9527sm1858821lfc.121.2023.03.01.13.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 13:23:08 -0800 (PST)
From: Zhi Wang <zhi.wang.linux@gmail.com>
X-Google-Original-From: Zhi Wang <zhi.wang.linux@intel.com>
Date: Wed, 1 Mar 2023 23:23:06 +0200
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
 <nikunj.dadhania@amd.com>
Subject: Re: [PATCH RFC v8 53/56] KVM: SVM: Make VMSAVE target area memory
 allocation SNP safe
Message-ID: <20230301232306.00005f86@intel.com>
In-Reply-To: <20230220183847.59159-54-michael.roth@amd.com>
References: <20230220183847.59159-1-michael.roth@amd.com>
	<20230220183847.59159-54-michael.roth@amd.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 20 Feb 2023 12:38:44 -0600
Michael Roth <michael.roth@amd.com> wrote:

> From: Ashish Kalra <ashish.kalra@amd.com>
> 
> Implement a workaround for an SNP erratum where the CPU will incorrectly
> signal an RMP violation #PF if a hugepage (2mb or 1gb) collides with the
> RMP entry of the VMSAVE target page.
> 
> When SEV-SNP is globally enabled, the CPU marks the VMSAVE target page
> as "InUse" while the VMSAVE instruction is executing. If another
> CPU writes to a different page in the same 2MB region while the VMSAVE
> is executing, the CPU will throw an RMP violation #PF.
> 
> Use the snp safe generic allocator for allocating the VMSA target
> page which will ensure that the page returned is not a hugepage, as it
> is already being used for the allocating the VMCB, VMSA and AVIC backing
> page.
> 

This should be merged with patch where implements the snp_safe_alloc_page().

> Co-developed-by: Marc Orr <marcorr@google.com>
> Signed-off-by: Marc Orr <marcorr@google.com>
> Reported-by: Alper Gun <alpergun@google.com>
> Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
> Signed-off-by: Michael Roth <michael.roth@amd.com>
> ---
>  arch/x86/kvm/svm/svm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> index 3fe5f13b5f3a..8bda31a61757 100644
> --- a/arch/x86/kvm/svm/svm.c
> +++ b/arch/x86/kvm/svm/svm.c
> @@ -665,7 +665,7 @@ static int svm_cpu_init(int cpu)
>  	int ret = -ENOMEM;
>  
>  	memset(sd, 0, sizeof(struct svm_cpu_data));
> -	sd->save_area = alloc_page(GFP_KERNEL | __GFP_ZERO);
> +	sd->save_area = snp_safe_alloc_page(NULL);
>  	if (!sd->save_area)
>  		return ret;
>  

