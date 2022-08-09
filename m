Received: from smtp-fw-6001.amazon.com (smtp-fw-6001.amazon.com [52.95.48.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F474428
	for <linux-coco@lists.linux.dev>; Tue,  9 Aug 2022 13:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1660053382; x=1691589382;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=odYNCkcIAQcBKQptQexLin/WRKzdil3fPD/Uqu4HkkI=;
  b=aEFzcalQ97hAG4bs2JdRqWh1VYvGCJfnHi664tJe/d/FqlvKXVw2DGNF
   0sl4Mb77jMqaH3pw2ip5ztIa2t/6kYAuQ4kVNeWE0WSFPGYG3tWmustKj
   S1MyZYCrFhh3nnAJx34sgJL686GkGPuP7OCHq+najECXbN6sNphKBVeTe
   U=;
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO email-inbound-relay-iad-1a-b09d0114.us-east-1.amazon.com) ([10.43.8.2])
  by smtp-border-fw-6001.iad6.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2022 13:56:08 +0000
Received: from EX13D24EUC003.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
	by email-inbound-relay-iad-1a-b09d0114.us-east-1.amazon.com (Postfix) with ESMTPS id 35EAD80383;
	Tue,  9 Aug 2022 13:55:58 +0000 (UTC)
Received: from dev-dsk-sabrapan-1c-164a86ac.eu-west-1.amazon.com
 (10.43.162.227) by EX13D24EUC003.ant.amazon.com (10.43.164.217) with
 Microsoft SMTP Server (TLS) id 15.0.1497.36; Tue, 9 Aug 2022 13:55:48 +0000
From: Sabin Rapan <sabrapan@amazon.com>
To: <ashish.kalra@amd.com>
CC: <ak@linux.intel.com>, <alpergun@google.com>, <ardb@kernel.org>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <dgilbert@redhat.com>,
	<dovmurik@linux.ibm.com>, <hpa@zytor.com>, <jarkko@kernel.org>,
	<jmattson@google.com>, <jroedel@suse.de>, <kirill@shutemov.name>,
	<kvm@vger.kernel.org>, <linux-coco@lists.linux.dev>,
	<linux-crypto@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <luto@kernel.org>, <marcorr@google.com>,
	<michael.roth@amd.com>, <mingo@redhat.com>, <pbonzini@redhat.com>,
	<peterz@infradead.org>, <pgonda@google.com>, <rientjes@google.com>,
	<sathyanarayanan.kuppuswamy@linux.intel.com>, <seanjc@google.com>,
	<slp@redhat.com>, <srinivas.pandruvada@linux.intel.com>,
	<tglx@linutronix.de>, <thomas.lendacky@amd.com>, <tobin@ibm.com>,
	<tony.luck@intel.com>, <vbabka@suse.cz>, <vkuznets@redhat.com>,
	<x86@kernel.org>
Subject: Re: [PATCH Part2 v6 26/49] KVM: SVM: Add KVM_SEV_SNP_LAUNCH_UPDATE command 
Date: Tue, 9 Aug 2022 13:55:35 +0000
Message-ID: <20220809135535.88234-1-sabrapan@amazon.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <fdf036c1e2fdf770da8238b31056206be08a7c1b.1655761627.git.ashish.kalra@amd.com>
References: <fdf036c1e2fdf770da8238b31056206be08a7c1b.1655761627.git.ashish.kalra@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Originating-IP: [10.43.162.227]
X-ClientProxiedBy: EX13D40UWC003.ant.amazon.com (10.43.162.246) To
 EX13D24EUC003.ant.amazon.com (10.43.164.217)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> +static bool is_hva_registered(struct kvm *kvm, hva_t hva, size_t len)
> +{
> +	struct kvm_sev_info *sev = &to_kvm_svm(kvm)->sev_info;
> +	struct list_head *head = &sev->regions_list;
> +	struct enc_region *i;
> +
> +	lockdep_assert_held(&kvm->lock);
> +
> +	list_for_each_entry(i, head, list) {
> +		u64 start = i->uaddr;
> +		u64 end = start + i->size;
> +
> +		if (start <= hva && end >= (hva + len))
> +			return true;
> +	}
> +
> +	return false;
> +}

Since KVM_MEMORY_ENCRYPT_REG_REGION should be called for every memory region the user gives to kvm,
is the regions_list any different from kvm's memslots?

> +
> +static int snp_launch_update(struct kvm *kvm, struct kvm_sev_cmd *argp)
> +{
> +	struct kvm_sev_info *sev = &to_kvm_svm(kvm)->sev_info;
> +	struct sev_data_snp_launch_update data = {0};
> +	struct kvm_sev_snp_launch_update params;
> +	unsigned long npages, pfn, n = 0;
> +	int *error = &argp->error;
> +	struct page **inpages;
> +	int ret, i, level;
> +	u64 gfn;
> +
> +	if (!sev_snp_guest(kvm))
> +		return -ENOTTY;
> +
> +	if (!sev->snp_context)
> +		return -EINVAL;
> +
> +	if (copy_from_user(&params, (void __user *)(uintptr_t)argp->data, sizeof(params)))
> +		return -EFAULT;
> +
> +	/* Verify that the specified address range is registered. */
> +	if (!is_hva_registered(kvm, params.uaddr, params.len))
> +		return -EINVAL;
> +
> +	/*
> +	 * The userspace memory is already locked so technically we don't
> +	 * need to lock it again. Later part of the function needs to know
> +	 * pfn so call the sev_pin_memory() so that we can get the list of
> +	 * pages to iterate through.
> +	 */
> +	inpages = sev_pin_memory(kvm, params.uaddr, params.len, &npages, 1);
> +	if (!inpages)
> +		return -ENOMEM;

sev_pin_memory will call pin_user_pages() which fails for PFNMAP vmas that you
would get if you use memory allocated from an IO driver.
Using gfn_to_pfn instead will make this work with vmas backed by pages or raw
pfn mappings.




Amazon Development Center (Romania) S.R.L. registered office: 27A Sf. Lazar Street, UBC5, floor 2, Iasi, Iasi County, 700045, Romania. Registered in Romania. Registration number J22/2621/2005.

