Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D0C3AFAE2
	for <linux-coco@lists.linux.dev>; Wed, 30 Sep 2026 05:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790744501; cv=none; b=HdZuuC8soiXA5Vf2725SaOI6SfemJ4vsssrTfghBUIAZSn006rYoudUXZQfMA5tD8R+d0ck2XcL/70UdNgSM9CAsOKckvFTSwjF28YkjVPql2JcbsTx+CtcA2+xaTyYOPkL8VgwW02+71ylJ4TjRzKKmoUzPRxxqUZJ1PYncviU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790744501; c=relaxed/simple;
	bh=aUKwU2DWc7V5Su7nqtW4pZQu87wWCIMqHJeLprSBsvM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dBXwSlazI8tNFSZT1NNT5cOvn8hrTayap7FmverEgIvf8ZJu8KBZV+wZSe4lRLFQtEwSc4VAlJ2UKs+uzcgFdHTujQLSM97TK6LicO1Ob7V4wwhFBiWecIEC7kbKS+Ro5NLduS0Vp153stJPs5s0ISMle6A0Ei7kUo3Zfo0fQpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OB5kutkh; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OB5kutkh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790744497; x=1822280497;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=aUKwU2DWc7V5Su7nqtW4pZQu87wWCIMqHJeLprSBsvM=;
  b=OB5kutkhknorjSM2CbSAeVVpBeL5lgG994lEFb4PKZDyZ0qjELTzFbwo
   rGH/90GX/Ls34P9KpEL7lkXgtt+nMvwvXWHa2MJT1QUM1G/mC/9qLYB+s
   s17Ui39B7pHAZcES9PyJGeQ7b1N5MQ6fD/bJ81BxrttYC3rd65pRx1JIR
   qFmgOHqjQntM5APyYQrJLdWYTW5X664J9HPpMcX2T/ZRhVn/UkVSAzc7w
   2kX9ByYFWk+5Hna5uRpyT2aBkCX/VlWANZYkJ3T9+aZpin8ljnLAWWc/F
   0ueMqwJ8bN18IdBXoUCXAY78tdIQAfXeW186aH+QZ3I9CbodkkzjvxQ78
   A==;
X-CSE-ConnectionGUID: qrkAaOWhRuOqRur+4BnfHQ==
X-CSE-MsgGUID: o+3p4lEIRSqBugdZrFulZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="91572139"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="91572139"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 22:01:35 -0700
X-CSE-ConnectionGUID: JFZwRH4+S+a5LPH6hoF1qg==
X-CSE-MsgGUID: QS/qow+DQM+CCI41419sUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="274186761"
Received: from binbinwu-mobl.ccr.corp.intel.com (HELO [10.124.245.162]) ([10.124.245.162])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 22:01:32 -0700
Message-ID: <2e6e9a97-e3f2-4978-93f4-bf6224b7a06d@linux.intel.com>
Date: Wed, 30 Sep 2026 13:01:29 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] KVM: TDX: Ratelimit the "EPT Violation on pending
 acceptance page" warning
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kiryl Shutsemau <kas@kernel.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, kvm@vger.kernel.org,
 x86@kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
 James Houghton <jthoughton@google.com>, Xiaoyao Li <xiaoyao.li@intel.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Ackerley Tng <ackerleytng@google.com>,
 Vishal Annapurve <vannapurve@google.com>,
 Sashiko Bot <sashiko-bot@kernel.org>
References: <20260930001127.3170009-1-seanjc@google.com>
 <20260930001127.3170009-4-seanjc@google.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20260930001127.3170009-4-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/30/2026 8:11 AM, Sean Christopherson wrote:
> Ratelimit TDX's kernel logging when a guest accesses an unaccepted page and
> has opted to disable EPT Violation #VEs for unaccepted accesses, as the
> pr_warn() is trivial for a misbehaving userspace to trigger.
> 
> Fixes: e6a85781f783 ("KVM: TDX: Detect unexpected SEPT violations due to pending SPTEs")
> Cc: stable@vger.kernel.org
> Reported-by: Sashiko Bot <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/20260923164348.2DB2D1F000FF@smtp.kernel.org
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Nit: should this patch be put before patch 2, to avoid a bisect window?

Otherwise,
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>

> ---
>  arch/x86/kvm/vmx/tdx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> index e3723f1222fc..4cac43299851 100644
> --- a/arch/x86/kvm/vmx/tdx.c
> +++ b/arch/x86/kvm/vmx/tdx.c
> @@ -1937,8 +1937,8 @@ static int tdx_handle_ept_violation(struct kvm_vcpu *vcpu)
>  
>  	if (vt_is_tdx_private_gpa(vcpu->kvm, gpa)) {
>  		if (tdx_is_sept_violation_unexpected_pending(vcpu)) {
> -			pr_warn("Guest access before accepting 0x%llx on vCPU %d\n",
> -				gpa, vcpu->vcpu_id);
> +			pr_warn_ratelimited("Guest access before accepting 0x%llx on vCPU %d\n",
> +					    gpa, vcpu->vcpu_id);
>  			kvm_prepare_shutdown_exit(vcpu);
>  			return 0;
>  		}

