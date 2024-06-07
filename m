Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18AB194AD6
	for <linux-coco@lists.linux.dev>; Fri,  7 Jun 2024 14:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717769034; cv=none; b=odY78HQVgercOfcsmJjelS6ERfWb6eHGDi5NN2M6k42iQx/fd/oq31HWGTg7zcUdePX/20oYOIW00PdreG+G0CSrGN42PkmJgRpUX2rEuh2ncGRtYX1t3m7V3ZjcrRTVNnjYdrEm/aQbD9QQ7OC4pqiaiICgsub8oa/UOXP9DFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717769034; c=relaxed/simple;
	bh=KlaaOF/7RRdWl7Ek3/y67Wh6c78qhL9KVAsKCLf9ETg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=Z3Hf7bJxtD4qwKa0u9n9sPNjGFQ6ZLhGheFWfC+FmCpQ7NjSAD4oAp4iY7/ZratWoH6hLrQ1hz55XzTFsx/7/W7OORfEqiaoh5AmR9yetVXQrcEAIVfYh/U8N7rDXXTAJugvq5EJFIuZHAgSOpetIS+JKVufAXxjFelzCbtBXi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QJ9OQSn4; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QJ9OQSn4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717769033; x=1749305033;
  h=message-id:date:mime-version:from:subject:to:
   content-transfer-encoding;
  bh=KlaaOF/7RRdWl7Ek3/y67Wh6c78qhL9KVAsKCLf9ETg=;
  b=QJ9OQSn4weuyAosWRwRNmklmbZRaNn9ML/xfWYsU0Tiy2l0+neJ59Uf1
   8NrkM6JAhHDXXqQlhzmWFeXjBC8sq6CZZ2oIlSAV+Dp8Hts5InvJKBR3Y
   mA7dYFUO/sdVas9PyZELlIT4xyd+c28uqmqeb3jLVzfFPZ2SWo0zEahwZ
   I+8p7Oz2iVYxIK1atuFj355LgasQdheQ+NFLaELyHB9SKLzR2r6U2aclQ
   BddeTIkTAIx/QRha2gZofPLy3jv/FmAskcjcNj9pQ63xYUl+/lwwdCAF2
   xATETpoZiSw2x5S4hVoy3UiukykdKAXR2o8316+GYLgtaS+5iY5Vzz8th
   A==;
X-CSE-ConnectionGUID: 2TYG+ITCRjyrt6a4e5z1lQ==
X-CSE-MsgGUID: HZbN+QqIT46rYRWbN4mW5w==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="31986438"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="31986438"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 07:03:52 -0700
X-CSE-ConnectionGUID: TuvgkAVzSpyErHgTTV8Q/A==
X-CSE-MsgGUID: wfugFFIhRBGS3rZMePnlZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="75817638"
Received: from unknown (HELO [10.125.208.55]) ([10.125.208.55])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 07:03:52 -0700
Message-ID: <5c79192c-58c3-40a8-ae11-642de0b9c027@linux.intel.com>
Date: Fri, 7 Jun 2024 09:03:50 -0500
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Dan Middleton <dan.middleton@linux.intel.com>
Subject: CCC Kernel SIG / Device Security call today 2024/06/07
To: linux-coco@lists.linux.dev
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

You can find today's meeting (and all CCC meetings) here:

https://zoom-lfx.platform.linuxfoundation.org/meetings/ccc

I expect more discussion on TEE-IO topics today.

Other topics are welcome too.

Feel free to reply here with them or offer them as we kick-off the meeting.


Thanks,
Dan

