Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF311610A
	for <linux-coco@lists.linux.dev>; Thu, 18 Jan 2024 03:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705549006; cv=none; b=mn5V4ezFu4Vf8uoLDkM6DEO39lPgbr7pdOW/nZhvCmtuijoLhxrajinKvyiXOl9B+pMVGQ4mwvEGI5bBnIByh67xySMRT5D40ayrtCtv8tAdXD2Aw4dw0HP03L4a5jp1tfTKfM3FqxwIMv+rXvRN4+HkIjXUAsQ7ZVqRHklCUbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705549006; c=relaxed/simple;
	bh=KHaJKuupFrb/5JLgFhafWv0RzApN98z5dybDAr16RQo=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding; b=hJy/3c4VbM3YN1w3vu6MlVFNCOZ4zUj//x8eAu/KyXHlC6yXnRYixarAy+Rhs+HB81pADOcXvmdh7zj2LwZvbn59vwot3lNjf8KKuWWpJ0xqqJwv/pvPYoFQE+zyBEerC8eDsNZeuxapQ9UPNMtznugMtRrpxKkWaiungxrVe2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O+PRy84f; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O+PRy84f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705549004; x=1737085004;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KHaJKuupFrb/5JLgFhafWv0RzApN98z5dybDAr16RQo=;
  b=O+PRy84fu6Uyna07zyroGoFIyO+4FRFmOvyfyhN95XieQARk+9LSU+lj
   pV+w6XXMwa0NNiClCuIkKMtz1w2kWu+wBGr1U5WB0eALs0F93tQoT84hG
   uRXdZewblECE0aZRmy0aAVQQ0GGZykOcOyKrnAzmEgv6GD4vRsZXih0/C
   o3mLgkLUGB9dwE25Fj7IQ6LvcDJG5yxeSkxEXIV8+YnwbgHc1YQaUD2JH
   YtVQFHDG1xSUaxCby5rsQv9nM65T7+SooGCjD3K2NLGcEuO1jRCoPxHIy
   GGxeFmOj/0MEogk01bg5Z9NsQYMCx73CusVczelKw02eISBcEsnWzfd5F
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7709232"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="7709232"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2024 19:36:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="26346462"
Received: from myalnuc.bj.intel.com ([10.238.158.152])
  by orviesa002.jf.intel.com with ESMTP; 17 Jan 2024 19:36:42 -0800
From: biao.lu@intel.com
To: sameo@rivosinc.com
Cc: dan.j.williams@intel.com,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 0/4] tsm: Runtime measurement registers ABI
Date: Thu, 18 Jan 2024 11:35:15 +0800
Message-Id: <20240118033515.2293149-1-biao.lu@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240114223532.290550-1-sameo@rivosinc.com>
References: <20240114223532.290550-1-sameo@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Samuel Ortiz wrote:
> Some confidential computing architectures (Intel TDX, ARM CCA, RISC-V
> CoVE) provide their guests with a set of measurements registers that can
> be extended at runtime, i.e. after the initial, host-initiated
> measurements of the TVM are finalized. Those runtime measurement
> registers (RTMR) are isolated from the host accessible ones but TSMs
> include them in their signed attestation reports.
>
> All architectures supporting RTMRs expose a similar interface to their
> TVMs: An extension command/call that takes a measurement value and an
> RTMR index to extend it with, and a readback command for reading an RTMR
> value back (taking an RTMR index as an argument as well). This patch series
> builds an architecture agnostic, configfs-based ABI for userspace to extend
> and read RTMR values back. It extends the current TSM ops structure and
> each confidential computing architecture can implement this extension to
> provide RTMR support.

Hi, Samuel
The ABI does not include eventlog, but eventlog is usually used with RTMR.
What do you think about how to implement eventlog?

