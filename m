Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA22C45C704;
	Mon, 21 Sep 2026 09:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789981400; cv=none; b=YFQapn/dEQQ1WiwwJmzVbWAj+m82JkBOE9M4WnKi5UZcOPwu59rQK479SQhBFdQdJ7lXLkiKSOgB85jf9OHphOv6JFPzX+uQ4PletT+BqOgoNQH0fxhyyCSYFJQfOwuAzuPQpXUVIK0XGRoIqjrvRuUj6tmXCDfgqRife4i+K8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789981400; c=relaxed/simple;
	bh=L6Ym8ZIu6y5nkeZnnYjPffmE2K/+n+j84VAR43y2xWo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cMa3mW+MqmMNP9iC44VxsqXxItYTH2ZlATqWb8dZraakL+uEhcSvfieaWQv10shVrqEnu/cjs0wNI/0h04JQCjKTF0vYLh4EUTPl9TrPTr3mIl2Lwzkih0xqTkVXfixMCdR7EhGXUtABJEeTBirMzzg57W8VYen0MNmhANUzfdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GVj+/jF3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GVj+/jF3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1BF81F000FF;
	Mon, 21 Sep 2026 09:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789981399;
	bh=gh9znaemej2ebTYyF4AgCaUdWFG09lPGQkBE3YiACFs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=GVj+/jF3q1YjJ5WBqJ4M0vvDiXAZIK8+FRFrOp/5IQN65WVRuVWo1IlGH4pb4fAN3
	 ih9Hv8pXP31hmbOBzJMUqOPHXGxZg08bV9B6qUIzRJ3/sf3N+VUWkOgX5PvT1cbm6S
	 haX8D1l1bUPQRTf4hxDZl6OWuAF+ewkwLLot4+RGi0G/iqyXIqCEqKHP+Kn68S2VEd
	 D872xUL/MsaVq7bRdM+Tjw7SpV9KeVUDqfzsJhieQffGRyXbKTFI3K5jKlitv2xrhR
	 X9G0MddNq/ynKxBcsL8U5ny6Y0zW28tTlCIEAz28wbLEsT+y0akd4IXEp23NO3fODa
	 L18ZmeGXsMUoQ==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH v12 1/7] firmware: smccc: Add an Arm SMCCC bus
In-Reply-To: <arDtJaSvZMgpnP1t@arm.com>
References: <20260921053807.354802-1-aneesh.kumar@kernel.org>
 <20260921053807.354802-2-aneesh.kumar@kernel.org>
 <arDtJaSvZMgpnP1t@arm.com>
Date: Mon, 21 Sep 2026 14:33:09 +0530
Message-ID: <yq5aa4pb3rjm.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Catalin Marinas <catalin.marinas@arm.com> writes:

> On Mon, Sep 21, 2026 at 11:08:01AM +0530, Aneesh Kumar K.V (Arm) wrote:
>>  MAINTAINERS                         |   1 +
>>  drivers/firmware/smccc/Makefile     |   2 +-
>>  drivers/firmware/smccc/bus.c        | 158 ++++++++++++++++++++++++++++
>>  include/linux/arm-smccc-bus.h       |  48 +++++++++
>>  include/linux/device-id/arm_smccc.h |  19 ++++
>>  include/linux/mod_devicetable.h     |   1 +
>>  scripts/mod/devicetable-offsets.c   |   3 +
>>  scripts/mod/file2alias.c            |   8 ++
>>  8 files changed, 239 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/firmware/smccc/bus.c
>>  create mode 100644 include/linux/arm-smccc-bus.h
>>  create mode 100644 include/linux/device-id/arm_smccc.h
>> 
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index c2414447892c..42364c540f50 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -24741,6 +24741,7 @@ M:	Sudeep Holla <sudeep.holla@kernel.org>
>>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>>  S:	Maintained
>>  F:	drivers/firmware/smccc/
>> +F:	include/linux/arm-smccc-bus.h
>>  F:	include/linux/arm-smccc.h
>
> There's also include/linux/device-id/arm_smccc.h introduced by this
> patch but not covered by MAINTAINERS.
>

I didn't add it because I couldn't find any other device-id files
tracked in MAINTAINERS.

-aneesh
