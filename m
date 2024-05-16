Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295BC12FB00
	for <linux-coco@lists.linux.dev>; Thu, 16 May 2024 08:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715848145; cv=none; b=Yr7wQY/OBmt7CnTbiWDzEW+yS+Agwz2E3SuyCM9W0oMqPHufe4Z9s3Hk4kaTwIse1ImToss9E3GeXHw6NGTFCKwAGM/2GvmmVDpp0fGp0/UnTb7/sXT/6bbh3ma0FVwhfqtqB/o08d2kRwBXZtpmJhOhuAZyuRaU4gerf0gBgLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715848145; c=relaxed/simple;
	bh=nxv5ycxArjTevmzgBjbrfNCqpXySQ4JMyvIe/0FBJjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=meRoZvysnO/N2lpCoAN121T+p62TAWuXGycSm2aVwdyplcv9y9+eH3hrxABN0aeq0gAaoI8/Qf9nSnS5oqdTill9IwnMD/m0bUOEbX9BnCPSQ2eUFc6ifvAnmxnXH2vc0kLZ4aaldUrvi7pKDYUzw1fuU2rshSFTbmym/1H4PCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kLjvnB1Y; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kLjvnB1Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715848144; x=1747384144;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=nxv5ycxArjTevmzgBjbrfNCqpXySQ4JMyvIe/0FBJjw=;
  b=kLjvnB1Yh3xQd+c0ifdyWq5xhGhV8Rjscx94NhBgikNYpH2t2sGxjiSJ
   ap9M1pjZGxcEhmmj8MVDnNQnscPIpYHUFi/JJojbOnPSVevXgLpRrrtoJ
   Aehe9UAT2Je3YCFqSL7mLvZaMt6fuIe0iCBE2yCwqPEQUinSb/uq4JEV/
   4J323bwQdjGrJE1AJilFLFKtclJ90Bx6iup9H8ap/WELrPEY3kInMWPVL
   xJeS5mQAVBv8PJUIymqzfte/HVhZgJcmKnRXDBGqqKWYO2h07z7sbuEEm
   wMbXV0n/dEmZJdPaKJnL9JnSb6N3a3RsTjh9SNYE6zil+ksPnnuVvnUJo
   A==;
X-CSE-ConnectionGUID: OluXLte4Qwe3yFVbVy7Xkg==
X-CSE-MsgGUID: O7W9LPf8Tcyxg74SIi3DIw==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="12154482"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; 
   d="scan'208";a="12154482"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 01:29:03 -0700
X-CSE-ConnectionGUID: a0gWeKCuRbW8XuYagLQEzQ==
X-CSE-MsgGUID: IemgONeeRz+3YI5JWUgR+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; 
   d="scan'208";a="31179894"
Received: from unknown (HELO [10.238.8.173]) ([10.238.8.173])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 01:28:54 -0700
Message-ID: <84e8460d-f8e7-46d7-a274-90ea7aec2203@linux.intel.com>
Date: Thu, 16 May 2024 16:28:51 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 09/20] KVM: SEV: Add support to handle MSR based Page
 State Change VMGEXIT
To: Michael Roth <michael.roth@amd.com>, kvm@vger.kernel.org
Cc: linux-coco@lists.linux.dev, linux-mm@kvack.org,
 linux-crypto@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 tglx@linutronix.de, mingo@redhat.com, jroedel@suse.de,
 thomas.lendacky@amd.com, hpa@zytor.com, ardb@kernel.org,
 pbonzini@redhat.com, seanjc@google.com, vkuznets@redhat.com,
 jmattson@google.com, luto@kernel.org, dave.hansen@linux.intel.com,
 slp@redhat.com, pgonda@google.com, peterz@infradead.org,
 srinivas.pandruvada@linux.intel.com, rientjes@google.com,
 dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, vbabka@suse.cz,
 kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com,
 sathyanarayanan.kuppuswamy@linux.intel.com, alpergun@google.com,
 jarkko@kernel.org, ashish.kalra@amd.com, nikunj.dadhania@amd.com,
 pankaj.gupta@amd.com, liam.merwick@oracle.com,
 Brijesh Singh <brijesh.singh@amd.com>,
 "Yamahata, Isaku" <isaku.yamahata@intel.com>
References: <20240501085210.2213060-1-michael.roth@amd.com>
 <20240501085210.2213060-10-michael.roth@amd.com>
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20240501085210.2213060-10-michael.roth@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 5/1/2024 4:51 PM, Michael Roth wrote:
> SEV-SNP VMs can ask the hypervisor to change the page state in the RMP
> table to be private or shared using the Page State Change MSR protocol
> as defined in the GHCB specification.
>
> When using gmem, private/shared memory is allocated through separate
> pools, and KVM relies on userspace issuing a KVM_SET_MEMORY_ATTRIBUTES
> KVM ioctl to tell the KVM MMU whether or not a particular GFN should be
> backed by private memory or not.
>
> Forward these page state change requests to userspace so that it can
> issue the expected KVM ioctls. The KVM MMU will handle updating the RMP
> entries when it is ready to map a private page into a guest.
>
> Use the existing KVM_HC_MAP_GPA_RANGE hypercall format to deliver these
> requests to userspace via KVM_EXIT_HYPERCALL.
>
> Signed-off-by: Michael Roth <michael.roth@amd.com>
> Co-developed-by: Brijesh Singh <brijesh.singh@amd.com>
> Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
> ---
>   arch/x86/include/asm/sev-common.h |  6 ++++
>   arch/x86/kvm/svm/sev.c            | 48 +++++++++++++++++++++++++++++++
>   2 files changed, 54 insertions(+)
>
> diff --git a/arch/x86/include/asm/sev-common.h b/arch/x86/include/asm/sev-common.h
> index 1006bfffe07a..6d68db812de1 100644
> --- a/arch/x86/include/asm/sev-common.h
> +++ b/arch/x86/include/asm/sev-common.h
> @@ -101,11 +101,17 @@ enum psc_op {
>   	/* GHCBData[11:0] */				\
>   	GHCB_MSR_PSC_REQ)
>   
> +#define GHCB_MSR_PSC_REQ_TO_GFN(msr) (((msr) & GENMASK_ULL(51, 12)) >> 12)
> +#define GHCB_MSR_PSC_REQ_TO_OP(msr) (((msr) & GENMASK_ULL(55, 52)) >> 52)
> +
>   #define GHCB_MSR_PSC_RESP		0x015
>   #define GHCB_MSR_PSC_RESP_VAL(val)			\
>   	/* GHCBData[63:32] */				\
>   	(((u64)(val) & GENMASK_ULL(63, 32)) >> 32)
>   
> +/* Set highest bit as a generic error response */
> +#define GHCB_MSR_PSC_RESP_ERROR (BIT_ULL(63) | GHCB_MSR_PSC_RESP)
> +
>   /* GHCB Hypervisor Feature Request/Response */
>   #define GHCB_MSR_HV_FT_REQ		0x080
>   #define GHCB_MSR_HV_FT_RESP		0x081
> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> index e1ac5af4cb74..720775c9d0b8 100644
> --- a/arch/x86/kvm/svm/sev.c
> +++ b/arch/x86/kvm/svm/sev.c
> @@ -3461,6 +3461,48 @@ static void set_ghcb_msr(struct vcpu_svm *svm, u64 value)
>   	svm->vmcb->control.ghcb_gpa = value;
>   }
>   
> +static int snp_complete_psc_msr(struct kvm_vcpu *vcpu)
> +{
> +	struct vcpu_svm *svm = to_svm(vcpu);
> +
> +	if (vcpu->run->hypercall.ret)

Do we have definition of ret? I didn't find clear documentation about it.
According to the code, 0 means succssful. Is there any other error codes 
need to or can be interpreted?

For TDX, it may also want to use KVM_HC_MAP_GPA_RANGE hypercall  to 
userspace via KVM_EXIT_HYPERCALL.


> +		set_ghcb_msr(svm, GHCB_MSR_PSC_RESP_ERROR);
> +	else
> +		set_ghcb_msr(svm, GHCB_MSR_PSC_RESP);
> +
> +	return 1; /* resume guest */
> +}
>
[...]
