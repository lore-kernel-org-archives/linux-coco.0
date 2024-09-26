Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E972145B10
	for <linux-coco@lists.linux.dev>; Thu, 26 Sep 2024 20:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727383779; cv=none; b=DcfsGvcRhJ2DXcgihvHDbwiweNiOk7+2KJAJ15IpgQ0sF5ZglOKEcp+iHqbwq1NxvjLaAVQ5WKpkzKnAT9gUll9ZwQCbG0IO1zskRybr+MAeuj14rSJR5NA1ZkC06hSVT85a+8D7bFyi9/zab+qsQ6juAYyWFRJFd8kG+Afo81o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727383779; c=relaxed/simple;
	bh=J5mtfqXhB6roljC568C+rpXXNOick6YX2huGra8kLw8=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=WMYvAke6Xb/OrupdRAUQ+BM6+OB02wgjNmagxm4DjMti+hXbcZC4UfIY9VFDh4JGYXpREEDM5hKaWm0510X/TuFKZTt2Q4shVFq3Uh1oK4dn51jZ0JGcGArtafbmXzAMnWMmPboxT5HKfX8MBMoSPSUxdDpEv9pBa5RfGCph47c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VY8zxdIB; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VY8zxdIB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727383778; x=1758919778;
  h=message-id:date:mime-version:to:from:subject:
   content-transfer-encoding;
  bh=J5mtfqXhB6roljC568C+rpXXNOick6YX2huGra8kLw8=;
  b=VY8zxdIBmJha2r31DJo76sRFjNmGGDGhTeXytLi+fxMF09dKrCqPKIli
   Dck7JDm3B4u/ZtR6hxAqRwNWP6yVTTKplP8wulS9lKYbQFuL+4SeIDdjc
   xI53HU+iwVfBZ75O0Ui9KTEDL2NCtSDpF8rsHo4bGuiJEdCVY5HmKRGcs
   cWS2ygfwhAvHsvmdk54/+pHjtmvjKEl7tlKUPGhtj0ct3eo3Qo8lbu2mk
   LXjLdlCIrP0+M8B2WrpL0Aj6kOk65hcK7gD4xG+A9bcBxodt6PhmQZYCj
   3WpRfDVJDBM6U7eVwmIeLY7Jx7hFWAl6XNQ9LIf+C4otbXt7zUYHgoi56
   w==;
X-CSE-ConnectionGUID: o0LDImv1TamjOs5uS32XDg==
X-CSE-MsgGUID: /aR5a4pHRN+hlg/XqBXoxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26679491"
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; 
   d="scan'208";a="26679491"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 13:49:32 -0700
X-CSE-ConnectionGUID: OlUexD8ZTc+GIrvSWfjyrg==
X-CSE-MsgGUID: kU5YdZItRByR148D1afdJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; 
   d="scan'208";a="103080718"
Received: from lscharfx-mobl1.amr.corp.intel.com (HELO [10.246.135.187]) ([10.246.135.187])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 13:49:31 -0700
Message-ID: <7a2e450e-bc83-45f9-ae86-b1872ae0aa23@linux.intel.com>
Date: Thu, 26 Sep 2024 15:49:28 -0500
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-coco@lists.linux.dev
From: Dan Middleton <dan.middleton@linux.intel.com>
Subject: No CCC Kernel SIG / device security meeting 9/27
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

No Device security / Confidential Computing Consortium Kernel SIG 
meeting this week.

Those lucky enough to visit Vienna last week are still digesting LPC 
conversations this week.  :)


Regards,

Dan Middleton

