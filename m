Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793603914;
	b=s8TWoCyMOCdcFT32TO8k8YASkfJfQR/1X9+FAGRtZVjv8bUuhEfNIof7APKlNy/JlvlQ
	 ivpDyFdoHXvfAmqsDO7KjNcvhErwXdSmSE8vrG9woR1y+esJluxDZ4Hc9dmYtDdwDp+/Z
	 1Too7fPi1KmDzMb3kqleCATQZExPcY+ulThw6go+S5/Wsh1vKK2g/5X/p5rlZfPoEp/qi
	 jskq/uyEWN6rj6OSg1ea5c+6i0L6LFCy1metCf5hyPNSp5YVZH3F3I14rCtO8yOd93efr
	 Tc9DArucQqJAA6fQZ9DAcsnlkeTedpIV45v+OwWFEaldHH3gyWzeFxOUyju/1NDTgPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793603914;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=AKYpB2+zrqXiyOQva5RgKPct/7/kmoifdAd8IOoSraE=;
	b=wbEJUcMW5zmt7OBy1DJhIhDhtWZjUg4QCzB7AOd88io1BJ6xsCByDVe36aD8uOwX2piH
	 seoM2U0o0f2o+p4788vdk7rCQT/LnaH6/l72/2/VBhK6pDyZf/o+eJXgvM1SnKwqaoDqw
	 pgoFWYxJP2k1vz7TVihLwUbZzz/77CCs2mzkAjyFm+zgZycjQ90DX+T+tZnniAu2E9LV9
	 UrtyvIFhH/fBBqA2s9670/wzPWXgJ1YHD+J657l1SaPj3FU1XyuHWYavoFhLOnpRjsRiM
	 bK6wBJPooOc99leR7Ep0o1+ZaFEgvsjprV16rT7C/cDSFL/93D+kOk7bgyJ82Bon8aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="fZdW/tZS";
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E99606A326
	for <linux-coco@lists.linux.dev>; Mon,  2 Nov 2026 07:18:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01E99606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fZdW/tZS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793603913; x=1825139913;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=KudH8oFsImGYL7mGO6FDNrAM7eIjgonP8sHENv5RJ7A=;
  b=fZdW/tZSE4YOQKKt3qHrLrLSuiJ0R/lGg3tXDW8QrDb4yGmci+C6Jk2/
   9n8m+Pn1L55v3wNwxd4l4e1vg0EyDB15z1bht4IhKxIvDTZvf8CFxTKGK
   0dkXQuUXl+9x09w/3mN0xe4HxONWGISdyvYHaE9kOrNoHHL9zfjqLl8Md
   zuq7Cofx2GxWG9bIZpfw2/imPHmNs9pdVOmzkEXOvZX80uAQNNkdxBC9u
   3UgjmL1jRpkOdw9l298k1WA975eN/Iv7/elRtvVjoENXckFFn4N/Uo76K
   QC/gVrcezh7Fkuz5pMMIdeun/CMah+fBY2c83JuQJ7OomqXksLoxC/sH6
   w==;
X-CSE-ConnectionGUID: qL+RabY5RvGJRnNPRNibjw==
X-CSE-MsgGUID: IRMYe+HNSQ65OHoEBxD6PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2278285"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2278285"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 23:18:33 -0800
X-CSE-ConnectionGUID: bvHAe9u6QVeycrZfagHV7g==
X-CSE-MsgGUID: Wvv3PDsyQwOVjQMSyYeJdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="5873618"
Received: from unknown (HELO [10.238.0.97]) ([10.238.0.97])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 23:18:29 -0800
Message-ID: <061b1963-7288-4f9f-97f7-54fab5b95ecd@intel.com>
Date: Mon, 2 Nov 2026 15:18:26 +0800
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/virt/tdx: Do not print error message on
 non-present feature
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, dave.hansen@linux.intel.com
Cc: x86@kernel.org, "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
 Nikolay Borisov <nik.borisov@suse.com>,
 Sean Christopherson <seanjc@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Chao Gao <chao.gao@intel.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, kvm@vger.kernel.org
References: <27b6d824f7aee7078167944ce96d95676eee25cb.1793602266.git.jirislaby@kernel.org>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <27b6d824f7aee7078167944ce96d95676eee25cb.1793602266.git.jirislaby@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/2/2026 2:51 PM, Jiri Slaby (SUSE) wrote:
> Before commit 165e77353831 below, the kernel did not print anything
> during boot if X86_FEATURE_TDX_HOST_PLATFORM was not present, unless TDX
> enablement was explicitly requested via a module parameter.
> 
> After the commit, when attempting to load TDX automatically, this is
> emitted to the log:
>   virt/tdx: TDX not supported by the host platform
> 
> It is emitted with the "error" level, hence it is disturbing. It is not
> an error to run CPUs without the feature.
> 
> Drop this silent-boot-breaking error message for the automatic
> initialization path.
> 
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Fixes: 165e77353831 ("KVM: x86/tdx: Do VMXON and TDX-Module initialization during subsys init")
> Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
> Reviewed-by: Sean Christopherson <seanjc@google.com>
> Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>

Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>

> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Chao Gao <chao.gao@intel.com>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> 
> ---
> 
> [v3] add reviewed-by tags and resend
> [v2] update the commit message.
> 
> Cc: Thomas Gleixner <tglx@kernel.org>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: x86@kernel.org
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-coco@lists.linux.dev
> Cc: kvm@vger.kernel.org
> ---
>  arch/x86/virt/vmx/tdx/tdx.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
> index 680e5178a86f..d910a290ac50 100644
> --- a/arch/x86/virt/vmx/tdx/tdx.c
> +++ b/arch/x86/virt/vmx/tdx/tdx.c
> @@ -1276,10 +1276,8 @@ static __init int tdx_enable(void)
>  	enum cpuhp_state state;
>  	int ret;
>  
> -	if (!cpu_feature_enabled(X86_FEATURE_TDX_HOST_PLATFORM)) {
> -		pr_err("TDX not supported by the host platform\n");
> +	if (!cpu_feature_enabled(X86_FEATURE_TDX_HOST_PLATFORM))
>  		return -ENODEV;
> -	}
>  
>  	if (!cpu_feature_enabled(X86_FEATURE_XSAVE)) {
>  		pr_err("XSAVE is required for TDX\n");

