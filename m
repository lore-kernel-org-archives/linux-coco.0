Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795589037;
	b=tvZggL64Ae10lslmqXmjbbDJTJwCvLAQHjcVnyCh/++jIqNOd3+O5HacX/7g8Wk+g97G
	 Fc/DfJ7Oa+EIV/ecMrLebJqNZL8g83jPicLc9tRfvnZOS54Gm2Hjr65p0IyuR6KKmplso
	 SMVlSIOJ4zoSdlJLcbJDfM2LJvb0a+Ea7h2R5A4b9voc0sTgN33PjwrlkU1jsKk5XzJbI
	 uaamEU2hPuB20uhFPT82voW5hJPm/S5pT2Zknx7KCXyRQaw9vJ4SqMD6nwB/sMRM2xfoa
	 vggsmVQQkH2rT8NlY2zskp7Ye7xRrc+y+EqKNsdU0RafJ+ts8gP9XU6szGEPsfK90Kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795589037;
	h=Received:DKIM-Signature:X-Mailer:From:To:Cc:Subject:In-Reply-To:
	 References:Date:Message-ID:MIME-Version:Content-Type;
	bh=q13A8N78udXeuD5wT7Dc+yiUnBQR4sfj7pE9LcG3Yl8=;
	b=XBbS3Rfx+uxAnhpiVKm0WfqNDY/kTf8l66Q/6R79u003fC/mx4fzuyM1NMX+e+a4DKhy
	 AmN0SKxlWs+mgdM4dLkhDKnUTA+10YBiluIC19nfDCHjELmbYwydM+LoNyh4F2ULKCY93
	 UhYAqROoD2I7VZL8qb6ovILCTd3GXnFKb+DGlOk4pIafxXjGj4drWD/7iqlnLPC+gOQPS
	 3GvMrIVOdz/fdU8RiVO3sDwRrYa3pBYGiJATO5kZTsQeaXE7cHMuIybsjUVSOjoRUaDSN
	 LRxrK0WHvDZbvTDPHT54gRvSYgL9NmPDtVqRDRDtvq0EeOt/K3su4M0AB8Wqg6Jps0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VrtAhmNn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60F0606A32D
	for <linux-coco@lists.linux.dev>; Wed, 25 Nov 2026 06:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VrtAhmNn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2566B1F000D0;
	Wed, 25 Nov 2026 06:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795589036;
	bh=q13A8N78udXeuD5wT7Dc+yiUnBQR4sfj7pE9LcG3Yl8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=VrtAhmNn+NIqAb/OF2PyEtlzHU+BrN2IhNNf9O1A8qPxmq/1bMXL1Fn1WvdGcoj69
	 ImXM4LUXKf2nF6mK1C/B54LbutZP1T0T9Rw7pJzmjd60iO3D1e3Yr8McXm1yOeiVUS
	 Ebtr2KKmujg9CT+kEVPITE4VeE0U2MfVx7o8TwW6zALDHQr5VB7D3h+T/Wu7UWPXOf
	 u1v6gdM17d3nfGKVqnpn0addCdEKBoF0I1q5ucP+iIzMDQggAnO76n7cEOayj3qvmE
	 qio9P97uM4pJ/R/1Mh7+6cWMGr4+vML8KQDVvZ31Gaz15zJYYoRaufdiEEsYHtr+iT
	 6P44g0zJHyBow==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Alexey Kardashevskiy <aik@amd.com>, linux-coco@lists.linux.dev
Cc: Jason Gunthorpe <jgg@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH 1/2] MAINTAINERS: Update TSM file coverage and repository
In-Reply-To: <d3ddb1a9-51d5-474c-8dd1-b52865b880ba@amd.com>
References: <20261116075420.76205-1-aneesh.kumar@kernel.org>
 <d3ddb1a9-51d5-474c-8dd1-b52865b880ba@amd.com>
Date: Wed, 25 Nov 2026 12:13:50 +0530
Message-ID: <yq5a4id5bec9.fsf@kernel.org>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Alexey Kardashevskiy <aik@amd.com> writes:

> On 16/11/26 18:54, Aneesh Kumar K.V (Arm) wrote:
>> Add drivers/virt/coco/tsm-core.c and git repository to the TSM entry.
>> 
>> Cc: Alexey Kardashevskiy <aik@amd.com>
>> Cc: Jason Gunthorpe <jgg@nvidia.com>
>> Cc: Lukas Wunner <lukas@wunner.de>
>> Cc: linux-coco@lists.linux.dev
>> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
>> ---
>>   MAINTAINERS | 2 ++
>>   1 file changed, 2 insertions(+)
>> 
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index ccbcdc0799b9..720fe907885b 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -28545,11 +28545,13 @@ M:	Jason Gunthorpe <jgg@nvidia.com>
>>   R:	Lukas Wunner <lukas@wunner.de>
>>   L:	linux-coco@lists.linux.dev
>>   S:	Maintained
>> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tsm/linux.git
>>   F:	Documentation/ABI/testing/configfs-tsm-report
>>   F:	Documentation/driver-api/coco/
>>   F:	Documentation/driver-api/pci/tsm.rst
>>   F:	drivers/pci/tsm.c
>>   F:	drivers/virt/coco/guest/
>> +F:	drivers/virt/coco/tsm-core.c
>>   F:	include/linux/*tsm*.h
>>   F:	samples/tsm-mr/
>
>
> I wonder if we can/should also do this now?
>
> +F:     drivers/crypto/ccp/sev-dev-tsm.c
> +F:     drivers/crypto/ccp/sev-dev-tio.*
>

I guess we need an Acked-by from the crypto maintainers before I can add
this in the next iteration of the patch?

-aneesh
