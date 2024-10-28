Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1004D15C13A
	for <linux-coco@lists.linux.dev>; Mon, 28 Oct 2024 16:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730131525; cv=none; b=PeV3ucnCIKOMI72GhmG8IJOFz3tjo+ysLrm7Dsj5C+vYjTA0bmtEuS4ui+6kY07EkiDG9lmgO1Nin7buRW2U6WcPlsAe3uMR01oV3z+jv60un89lNhpakHADPQ2kHwW7eJ9YSOW+6mTRDMspAREIyy4YNn4y86OQ3NQvxtv7MiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730131525; c=relaxed/simple;
	bh=vsAhtPVHG4bKUiESvmONgAC6MCUbOqGbyyYCt5PVZzs=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=pHY9Ms/N11/X5vAtLr08GRXbONpEMeHQ1UgNuygxiUEar38CUCLldUTewnKzBD5ZDgXjkPabB0rzbXh00gPo8CF9LJI4AAcMPUKGFlMwnUOxj/hCZZ0abkYmIa4Glyuypy12/YQublAmTFgFJxpyXXmrGcGuxQMqViFwkypuTdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H8+gdEI3; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H8+gdEI3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730131524; x=1761667524;
  h=message-id:date:mime-version:to:from:subject:
   content-transfer-encoding;
  bh=vsAhtPVHG4bKUiESvmONgAC6MCUbOqGbyyYCt5PVZzs=;
  b=H8+gdEI3OWGkC+LIK0wIKcee2oI1PH3Hstr1DeAIL7VMSJ1NF2HhJawD
   kqUWtP5O6V7QmW7xfEhS5XZN/o3C57LB3GVEaw/5LBzAzO/uFAXW6E3hq
   3eje2NeJnhz/nQlUoPpxd4huDhij5JfqdUwA1KuzgofdF8L2W3YPdQZcA
   5SHZvnXqbISqzNoEQYztI638yKq+Hwrt0KD4Ccy8lRJ3m4wOAk4jStqfD
   uo14VeMyALT0y8dZQm9Gb7QLQmZ+88pnWZWtKXVLRhE4S5W+q+hr8z1sG
   CIcrwrIoMiluDUlMq90Gj78k7erSHuVxBRsBJ6DDpPrnLc/31i571a23K
   Q==;
X-CSE-ConnectionGUID: XkWCnFzmTNKKgcj/oMR0PQ==
X-CSE-MsgGUID: GtLeyLEhQlq8p9gvNsgrcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47196072"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="47196072"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 09:05:24 -0700
X-CSE-ConnectionGUID: gKAiE068TQ6HZQ9JfWIMgQ==
X-CSE-MsgGUID: wmuoE+KmShyWL97ez2+zMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="82082286"
Received: from lscharfx-mobl1.amr.corp.intel.com (HELO [10.246.135.187]) ([10.246.135.187])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 09:05:23 -0700
Message-ID: <2f971fe8-0b42-4187-afc3-783b07beaa23@linux.intel.com>
Date: Mon, 28 Oct 2024 11:05:21 -0500
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
Subject: [CFP] Open Confidential Computing Conference (OC3) 2025
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

The CFP is open for OC3 2025.

OC3 is one of our community’s main conferences. Submitting a talk is a 
great way to grow collaboration for your project.

At the link you’ll see the 2025 categories: Foundations, Cloud Native, 
Apps & Solutions, Attestation, and AI.

https://www.oc3.dev/call-for-submissions


Dan Middleton (he/him)

Intel 
<https://www.intel.com/content/www/us/en/diversity/diversity-at-intel.html>Senior 
Principal Engineer

CCC <https://confidentialcomputing.io/>TAC 
<https://github.com/confidential-computing/governance/>Chair

