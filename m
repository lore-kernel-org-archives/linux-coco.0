Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D76F320CAE
	for <linux-coco@lists.linux.dev>; Wed, 14 Jan 2026 02:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768359549; cv=none; b=nPMYfEwQ3h/LK8rFv4zWNbtU4iPYtbjnYMBPhjQEDMJvoSUVspB4BQ83kbnZNcUGxYp6SBtgrOcL1j2/wVJ668SwaYkmfAp8J2IfbrxpR2X6ql9P75wrstx5155B1RZlk1dHtpf7bXG7xzV2s7jdVmn2aE79Y6ztvUtg4zDJn2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768359549; c=relaxed/simple;
	bh=2FLneze9RCiJQc8F+WUlfx7krZwJR62dn5vkLtpJUXk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SkN/EOXZv7bTYwrUd7sTdScC2MAbpShlk5WLIWOzawjzkTt+rLcDAEhofWpbbEDA6sj0DTf95qhclp2PDRXIoCpG4zzOxRgG8Z9GQ90KSygYShZJOI7SJn+Yqd5EyXX2rcKc8hPlBZrk/5z9zuUXsbO68P8197N6d9Ef7jQyIMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HkmWsZFN; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HkmWsZFN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768359548; x=1799895548;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=2FLneze9RCiJQc8F+WUlfx7krZwJR62dn5vkLtpJUXk=;
  b=HkmWsZFN6tubqteP8uDEmX4eAuEN49BDRvlpFRfqynaVE3UHu7Zdh7f4
   LEpmrIUkjQvyfKAG5y/Qm6XDmaHuh+GVcz0qaCpBXJywE7weDp4kAIbqE
   2glutWxCVlpiFBX//tSeFUR8NduxAJqy8fCrRWD0FWALR0BqMhgRJWbDU
   D2TBfGi57fccrAnT92O9K1AJhj/Se+cFyDvbrxcT7v8SL3tDMlcGS8h8q
   EgSp2mrAwHr9i4A8HLir+sia0gdALYUXgi8erxcjXR0GVR+gJoC8qZj4o
   cqydUN1pk00i74BcgTnwjihT/XlL7BcrBZKut6C/1fRUXlG3t8bI9ynXa
   Q==;
X-CSE-ConnectionGUID: kxrRfwqATDW2bXek2SGTkA==
X-CSE-MsgGUID: /xzb+UOUQ3qCXfPjLdSb3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69555836"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="69555836"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 18:59:07 -0800
X-CSE-ConnectionGUID: JvYJjUfLSsSij8snFizvuw==
X-CSE-MsgGUID: uZbt92fASL+2WKZA2fMhIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="204621414"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.124.240.173]) ([10.124.240.173])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 18:59:03 -0800
Message-ID: <43a0558a-4cca-4d9c-97dc-ffd085186fd9@intel.com>
Date: Wed, 14 Jan 2026 10:59:00 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: TDX: Allow userspace to return errors to guest for
 MAPGPA
To: Sagi Shahar <sagis@google.com>, Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Kiryl Shutsemau <kas@kernel.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
 Vishal Annapurve <vannapurve@google.com>
References: <20260114003015.1386066-1-sagis@google.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20260114003015.1386066-1-sagis@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/14/2026 8:30 AM, Sagi Shahar wrote:
> From: Vishal Annapurve <vannapurve@google.com>
> 
> MAPGPA request from TDX VMs gets split into chunks by KVM using a loop
> of userspace exits until the complete range is handled.
> 
> In some cases userspace VMM might decide to break the MAPGPA operation
> and continue it later. For example: in the case of intrahost migration
> userspace might decide to continue the MAPGPA operation after the
> migrration is completed.
> 
> Allow userspace to signal to TDX guests that the MAPGPA operation should
> be retried the next time the guest is scheduled.
> 
> Signed-off-by: Vishal Annapurve <vannapurve@google.com>
> Co-developed-by: Sagi Shahar <sagis@google.com>
> Signed-off-by: Sagi Shahar <sagis@google.com>
> ---
>   arch/x86/kvm/vmx/tdx.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> index 2d7a4d52ccfb..3244064b1a04 100644
> --- a/arch/x86/kvm/vmx/tdx.c
> +++ b/arch/x86/kvm/vmx/tdx.c
> @@ -1189,7 +1189,13 @@ static int tdx_complete_vmcall_map_gpa(struct kvm_vcpu *vcpu)
>   	struct vcpu_tdx *tdx = to_tdx(vcpu);
>   
>   	if (vcpu->run->hypercall.ret) {
> -		tdvmcall_set_return_code(vcpu, TDVMCALL_STATUS_INVALID_OPERAND);
> +		if (vcpu->run->hypercall.ret == -EBUSY)
> +			tdvmcall_set_return_code(vcpu, TDVMCALL_STATUS_RETRY);
> +		else if (vcpu->run->hypercall.ret == -EINVAL)
> +			tdvmcall_set_return_code(vcpu, TDVMCALL_STATUS_INVALID_OPERAND);
> +		else
> +			return -EINVAL;

It's incorrect to return -EINVAL here. The -EINVAL will eventually be 
returned to userspace for the VCPU_RUN ioctl. It certainly breaks 
userspace. So it needs to be

	if (vcpu->run->hypercall.ret == -EBUSY)
		tdvmcall_set_return_code(vcpu, TDVMCALL_STATUS_RETRY);
	else
		tdvmcall_set_return_code(vcpu, TDVMCALL_STATUS_INVALID_OPERAND);

But I'm not sure if such change breaks the userspace ABI that if needs 
to be opted-in.
