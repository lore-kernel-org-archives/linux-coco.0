Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EE3348D893
	for <linux-coco@lists.linux.dev>; Mon, 14 Sep 2026 15:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398424; cv=none; b=Gn7Ug8L1vvRJESOPaK9wCVEJgmG5mzYdFKKwe/JBT2ks+92UPjucPcYfRl5+bvQcrAceGRYnFzTAH05L9GKI0wGTrLJ2lRwThayo87n3cOL5+JgpwgkyOUcEgAZ2yexqJrP/kpXM1K/R/CSYsI7N++Netjyp2HX+M//mvG8YrHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398424; c=relaxed/simple;
	bh=XzETh458EMmHv/nebgcl7LJ0C1wpe+M5WrH2ESXepO0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bFLPOUTy4PuXtPcAnM2qX/uAwpZ3n9ldODD0XYCNrZ18vyFWgzFA9sLpQoS2pf3BX75yPgfeBkXoO4MnQCi4ijOSub+zds1OCExERKkwcu13+a8N4W37Z+/TuJHCNm0ESjLVmRg5LlGkjynPPxMswGQaTSy8TrC+ICYQgn+Bsy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=I1NHMIEF; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="I1NHMIEF"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CBAF3153B;
	Mon, 14 Sep 2026 08:06:57 -0700 (PDT)
Received: from [10.0.128.139] (unknown [10.0.128.139])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4CFE73F882;
	Mon, 14 Sep 2026 08:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789398421; bh=XzETh458EMmHv/nebgcl7LJ0C1wpe+M5WrH2ESXepO0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I1NHMIEFhs72nShHbOJbu59UNuDa1T8JkI2LuKQLFINojMBKusl12ZE7kvP1bfh3z
	 kvdSyTO/mLUw995M/YcRXqAMImpCWXwbOc+htPifPVTQ+saYZ3Huit2NAlxfPuY/z/
	 0FqOopLmbUIsDJXXJoocSW1HHbVHb2HhDiuomoWQ=
Message-ID: <af71bc16-a6ca-4c67-a515-0ba64e8b697e@arm.com>
Date: Mon, 14 Sep 2026 16:06:57 +0100
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 5/7] virt: coco: arm-cca-guest: Rename TSM report
 source file
Content-Language: en-GB
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
 linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Jason Gunthorpe <jgg@nvidia.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Greg KH <gregkh@linuxfoundation.org>, Jeremy Linton <jeremy.linton@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>,
 Andre Przywara <andre.przywara@arm.com>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
 <20260914060511.277948-6-aneesh.kumar@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260914060511.277948-6-aneesh.kumar@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/09/2026 07:05, Aneesh Kumar K.V (Arm) wrote:
> The Arm CCA guest driver currently only implements TSM report support, but
> follow-up changes will add more TSM-related functionality to the same
> module.
> 
> Rename arm-cca-guest.c to main.c and build it as an object of the
> arm-cca-guest module. This leaves room for the module to grow additional
> source files.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>


