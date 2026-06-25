Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F61C3BED27
	for <linux-coco@lists.linux.dev>; Thu, 25 Jun 2026 06:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782367719; cv=none; b=POoflYrRNChO4TS4wjAdSO8ksAJCkhPOwds2Id4PSQWea3IivKNgbC2CS7krdLsiEVuJ9LfECeHfsInLhkKO5E2QBa+rWxlJw2r86ONSBMqgWdDXdqABRXy5rJI6bOhD0VLzpT8tqyliQdAQNXNEWyKBFtt8YHmtgfOhfq9mDi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782367719; c=relaxed/simple;
	bh=wE6FUORWICsZaUu8+k75QDZ5NISqglgKV1wI8LHQqDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dd3A65qb4lcxBjEkYtmJM+8+L16E53rlPgzHIjMsPadzZrLoMqLSD9caAlEnsJFiS+gssMCsvgais/8FCU+A4LGokiCUlQ9AEPkisf12OQqikh2Ccto3Lc02CUqPMlVgKZqtQZwRdH7WhIiMlUkqjSHEfnz5syzoDXAeB0FKmCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NwJtTwSH; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NwJtTwSH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782367717; x=1813903717;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wE6FUORWICsZaUu8+k75QDZ5NISqglgKV1wI8LHQqDg=;
  b=NwJtTwSHxdW9PUeGsLmRyoh6WtKIgn4ilNXhyqsJtfLhIC899A7RvTEk
   ZwEs4sWtET2uInhygWdUtGIcStVw3n40jI4EdSGReT+k5U8bEe0hqz3Y0
   RP6C2Pcn8Dr81BuI7+lm3MXEoy15EfCEFDnF3UHbXHKYExN5YHKou7JqT
   MerrWUz1asYWVBtDXt/AXmpJDRihrt03Xo4JsydMl1743n28FFQOvRIvr
   TWIRECsJQcEk9Kg/WM8YhKIOefwbKpBWvnKgdbLA63GID1NvBdu+v5IW8
   CMe94Ox9oCz1Cz6X8DJYoJb9BVeDkB6DRtaK5s1Feejj9Ut2tZe29DMbg
   Q==;
X-CSE-ConnectionGUID: 3GIK39qaS6maI1UJukv90g==
X-CSE-MsgGUID: 2p4WlGyCQCCfkg8NKFPRYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="83190633"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="83190633"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 23:08:37 -0700
X-CSE-ConnectionGUID: xMKDMZ28RwOkIY78DOVPCQ==
X-CSE-MsgGUID: xKbjWsWYSymZDbqs4dM+OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="288479150"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 23:08:31 -0700
Date: Thu, 25 Jun 2026 09:08:28 +0300
From: Tony Lindgren <tony.lindgren@linux.intel.com>
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: x86@kernel.org, kvm@vger.kernel.org, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, djbw@kernel.org, kas@kernel.org,
	rick.p.edgecombe@intel.com, yilun.xu@intel.com,
	xiaoyao.li@intel.com, sohil.mehta@intel.com,
	adrian.hunter@intel.com, kishen.maloor@intel.com,
	peter.fang@intel.com, baolu.lu@linux.intel.com,
	zhenzhong.duan@intel.com, dave.hansen@intel.com,
	dave.hansen@linux.intel.com, seanjc@google.com
Subject: Re: [PATCH v2 08/17] x86/virt/tdx: Prepare Quote buffer during
 extension bringup
Message-ID: <ajzF3F5N8ix3SCzm@tlindgre-MOBL1>
References: <20260618081355.3253581-1-yilun.xu@linux.intel.com>
 <20260618081355.3253581-9-yilun.xu@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618081355.3253581-9-yilun.xu@linux.intel.com>

On Thu, Jun 18, 2026 at 04:13:46PM +0800, Xu Yilun wrote:
> From: Peter Fang <peter.fang@intel.com>
> For simplicity, let all guests share a global buffer. Build the buffer's
> HPA_LINKED_LIST at Quoting extension bringup. This saves a bunch of
> va-to-pa conversions at runtime.

To me it seems the pre-generated parts can be made into a template that
can be copied to an allocated buffer looking at patch 11/17.
