Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793095680;
	b=gdTnC/ilWzZOSGWIufQZNQ4fyo8eLCEjJZzhFjkzVa9Uj2cyNFnDGjvNoTVqRVeX8Vq3
	 Y67393HP0QQO8ZEbyDukOukZvRP9kKWTA86+qLecYfSEkLJddaP1ewcRdOLpOdNYFSO42
	 KTXlbq/4JuiEUiCYsR4DYy8hFtakOiCZ3KW/wNiXJ30Retdf2zACXGXEAeRAW87aCxPZI
	 4haw1OccReobEj873zo1dZFNdG0QNmXmyjpcb8PAe/ITQesAphtRiEMKB3PvziojCiF8o
	 qut+Ha2rzF/2L/uKr4+xKydjFo+dL0rBTlzyvfHG9/ZXPSBgb9YoAaxLUkEBw/01rvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793095680;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Fy1/w0tKCkDMHDFcbllgMw30STzvQwiUbpmEywxPMxE=;
	b=CB6lLTuuM0Gcqs+RD13JPCUMpVCWOOn1Wur2lG/OqQBtPMAswr9WdaswMWtA5aAu8aw3
	 W/nK39VYEf0iUVbFieAhsHg9zKgT7sIBWM8oK5XUZVNOFrZVGkxcQ6L4yv+ajdHALoboo
	 FLwTuiaDfb5YqGOCEvcvpPF1MOyhTqqy/mztVhJMjngfpRoHYIWUH12n4zYT3DdUXzrV9
	 UYNdlJJRsB1YpbosH1Bl45pj3kLzZdiySjRBgF0XUAD9napBrfd1ras2HNTNmRAhkMmMC
	 Q2JXI5h7KZyYRvSZN7U2QT2EDDC1/h+lPOYcNlBKQOxc7Mmfw9YV6B0HmKvJEeYjjiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ayw1f5Ok;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C141A606A31A
	for <linux-coco@lists.linux.dev>; Tue, 27 Oct 2026 10:07:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C141A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ayw1f5Ok
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793095679; x=1824631679;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=gs69Hr8NaS2oi94sSYiW5CguYSbtSLpu1VvGRgcWZZU=;
  b=ayw1f5OkLZXXoyqt7hy13F9uCOtmDE838VFRrbRFOYv7t4kkZTX8fq3a
   4+eUUdlRW3m3acFIyLGEGkCeTiGV2j+7YruRifLUYn4yja5qpi1F71udm
   bOI0wc+YLQQnxt2zNx4+C8Bntyq1gLf/BNaiKDkTpx1pbWKh2E5JKRN1i
   2/EP4ZdAftj5SX1DKaivqm2fHaPbuXy8DJtOs8u3ItVzhfRXq7u4UCWdI
   myz55jVnU78XTyOwd0UzfqldY0W95gmwOhuYkdnmU08RxTR7l5JueVlwI
   OEQpaCVZoE/eMY9tZiG+nZHveEFwyvwalLjDInagaKRgPxWZtrzlLLVYm
   A==;
X-CSE-ConnectionGUID: zpGFK5YwTxW16g+og1vAPA==
X-CSE-MsgGUID: 44MMTnyqR9KfWkvc0MjG9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1672948"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1672948"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 03:07:58 -0700
X-CSE-ConnectionGUID: lj3Az8n5RaypGRDzE2NWfA==
X-CSE-MsgGUID: Aw7ZFwKVS6ysJa7lefFcnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4653034"
Received: from unknown (HELO [10.238.2.205]) ([10.238.2.205])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 03:07:55 -0700
Message-ID: <d4b5d0dc-64fb-46c2-a578-8828e14447a3@linux.intel.com>
Date: Tue, 27 Oct 2026 18:07:52 +0800
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
Subject: Re: [PATCH v2 0/3] x86/cpuid: KVM: TDX CPUID fixes
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe
 <rick.p.edgecombe@intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-coco@lists.linux.dev, Changyuan Lyu <changyuanl@google.com>,
 Sashiko <sashiko-bot@kernel.org>
References: <20261022210134.612848-1-seanjc@google.com>
From: Binbin Wu <binbin.wu@linux.intel.com>
Content-Language: en-US
In-Reply-To: <20261022210134.612848-1-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/23/2026 5:01 AM, Sean Christopherson wrote:
> 
> Changyuan Lyu (1):
>   KVM: TDX: Set SIGNIFCANT_INDEX flag as appropriate when filling CPUID
>     entries
> 
> Sean Christopherson (2):
>   x86/cpuid: Mark CPUID function 0x23 as being indexed
>   KVM: TDX: Reject KVM_TDX_INIT_VM if indexed CPUID functions don't
>     match

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
