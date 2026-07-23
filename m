Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4AEC38E5C5
	for <linux-coco@lists.linux.dev>; Thu, 23 Jul 2026 05:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784785436; cv=none; b=vFUnzsVYL0itBOrs7Qb7wcDFywnBB3d2PMj/1EAluNxJb7LNzahxOjsmZ4OQSzWtJgZiqSDQ7EU6jISzz7Z90XIl4fT/LOyZt2W77Eq5+YO6NPu8+Kda2va/HZ1hDePxTsvRvRWqMWTpjMmWXJI3HZNCW7iRxNJy34f0L9QFc30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784785436; c=relaxed/simple;
	bh=A02UVXLHDw+ZkbLlGm+nBaD7lEA4chzRcr/H1crlHQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JyV4gHS1r0kkjc7Tqp8pmy3fFYR+Eko9Fioy7l5+EUC2eTP7Q05Ya0TJE+U19P03PToZj7aPFr6nYFr0lFqKyvRqtXaKamF1JxJ5xsLE4wGKlI3g8ydJxrM2MfcIVk9J3KS0OM6xBkFKhp4LWU88Db0vaqZ3DH7Pkv2vVbmwTuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ji2R7lMO; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ji2R7lMO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784785435; x=1816321435;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A02UVXLHDw+ZkbLlGm+nBaD7lEA4chzRcr/H1crlHQg=;
  b=ji2R7lMOsvnmgldUxDnBoJePyvuiiwfOZmaL9Kiro3uGb8HOp4lnuKwU
   0gz3fs+xMBOh4Uc5Bd2saqbJI+uVALc4M+N0WyF+oK854/yTKeW8Fr5ne
   Cdnw8UNDz68xc1W6kQzmZkV20cOMpy6FhqRD0darp9W28rGLYXT+Aq1SU
   +SSmpTnf35r1uIfopaSHZgWf2vpDfHuB3enEd9lWJcpl6AcAo43xdjXaL
   mAT+xeK+FSWQ5QWxj3BASiwds2o/UAnzTu+C9u8CoIC+J0VipYWsLf+7C
   Cux5metUwt+pYbiyMN3uvIXMbGc8z+xQUMjcjCQtB1d9aDVI30089YdhX
   A==;
X-CSE-ConnectionGUID: tAtyGVkTTb+MhEqtaaPubQ==
X-CSE-MsgGUID: UIXpRz0aSx+xTGKtc9FshA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96947669"
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; 
   d="scan'208";a="96947669"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 22:43:55 -0700
X-CSE-ConnectionGUID: 4MAx3QA0SJmi4y63DOtvrg==
X-CSE-MsgGUID: FrLszd8/TLCOdaLJaKhJ/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; 
   d="scan'208";a="262629626"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by orviesa005.jf.intel.com with ESMTP; 22 Jul 2026 22:43:52 -0700
Date: Thu, 23 Jul 2026 13:43:51 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	rick.p.edgecombe@intel.com, dave.hansen@intel.com,
	dave.hansen@linux.intel.com, yilun.xu@intel.com, djbw@kernel.org,
	linux-coco@lists.linux.dev, chao.gao@intel.com,
	peter.fang@intel.com, xiaoyao.li@intel.com
Subject: Re: [PATCH v3] x86/virt/tdx: Formalize SEAMCALL version encoding
 support
Message-ID: <amGqFxt/9DquRGO3@yilunxu-OptiPlex-7050>
References: <20260722084634.131020-1-yilun.xu@linux.intel.com>
 <amCnuX8XAjxWFlHd@thinkstation>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amCnuX8XAjxWFlHd@thinkstation>

On Wed, Jul 22, 2026 at 12:23:04PM +0100, Kiryl Shutsemau wrote:
> On Wed, Jul 22, 2026 at 04:46:34PM +0800, Xu Yilun wrote:
> > While both options have merits, I chose the latter from a
> > software-centric perspective. I sent v3 to invite more discussion.
> 
> I still don't see what postponing the encoding to assembly buys us,

Sorry, I overlooked it. I think this gives us consistent view of what
'fn' is for all seamcall-related functions.

> but it is not the hill I want to die on. The result is centralized
> and correct, so let's move on.
> 
> Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

Thanks!
