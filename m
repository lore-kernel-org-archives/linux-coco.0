Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB9F3C4B89;
	Thu, 14 May 2026 14:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778769456; cv=none; b=E0NR/mHE4C85N0t+0H9u8admbertcRmKiLnsx+0XeUbbxVs//0rbjjGCr5kHKAfTNRbxZNdsJYoVrKcEs61/uGo2Ag7dYLvuq5B1nqjzX9HdA90vjf37mBt5BGb/p/4N/lyGvjXDin9acG2/PT1/E2feXU8c76VCI1vUfqxXo8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778769456; c=relaxed/simple;
	bh=5W0K9iBEUCn46xSeJ55rbYqtqOk71IxZe2qy8fAmrOc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=U/e12jlQYUNvB+KlCXBmivtzSp2SRVq4jHj1eGs4YfgYfqyQxmI4qrLu3qxju6gghDT0zXos9ROn6WiwJUfGPBzQ+GzJ6iPdrxno7jOe/wiqLuKLAG6wma8uOAPIcSw67oqeoYTnW06cAjbx4yjk2m737J0gmlpjeS4qswz/fnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=flgII5oQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="flgII5oQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56EB1C2BCB8;
	Thu, 14 May 2026 14:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778769455;
	bh=5W0K9iBEUCn46xSeJ55rbYqtqOk71IxZe2qy8fAmrOc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=flgII5oQWod75/+VvpbrvPqurD+8EQsFF/6rslkO5JrORlOD9psM56EQMXrt6gwRK
	 dKkUd6eh5KOY1supt5mwl8Df622Chcvfj8FieTa+8Vxfl1Ii51BFJAq86fw7QlsJja
	 6m4VvaEyCWJLEs39SdUoj0mtZycgGHPRn1Y8Gxh1jiKP8N5kbGGBABQ0etGH2SBJcV
	 x9n1WguF8hbJty5QgGAvBNLVBrnz4uPH0ygRt5Rnh3mT5oVeFZR13INQapEVKwdDLb
	 SL72FxcYfLTFtkUGEEPTB+iuhHa8UecHZ0SWPOuY96MnOZmXhoxPDDK0Z12chCEw61
	 p+Fa1cKojq0jA==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v5 1/3] firmware: smccc: coco: Manage arm-smccc platform
 device and CCA auxiliary drivers
In-Reply-To: <2026051420-amusement-drove-73e6@gregkh>
References: <20260514094030.42495-1-aneesh.kumar@kernel.org>
 <20260514094030.42495-2-aneesh.kumar@kernel.org>
 <0c88bcee-65b5-4328-87e6-e1c714c3d1ca@arm.com>
 <2026051420-amusement-drove-73e6@gregkh>
Date: Thu, 14 May 2026 20:07:27 +0530
Message-ID: <yq5alddm5a6w.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Greg KH <gregkh@linuxfoundation.org> writes:

> On Thu, May 14, 2026 at 12:04:13PM +0100, Suzuki K Poulose wrote:
>> Hi Aneesh
>> 
>> On 14/05/2026 10:40, Aneesh Kumar K.V (Arm) wrote:
>> > Make the SMCCC driver responsible for registering the arm-smccc platform
>> > device and after confirming the relevant SMCCC function IDs, create
>> > the arm_cca_guest auxiliary device.
>> > 
>> 
>> There are a few changes squashed in to this patch. Please could we
>> split the patch in the following order ?
>> 
>> 1. Add platform device for arm-smccc
>
> Do not make any more "fake" platform devices please.
>
>> 2. Move TRNG to Auxilliary Device - (Even though it is a later patch, move
>> it before the RSI changes)
>
> No, move it to the faux api please.
>


Maybe I was not complete in my previous reply. I did not want to repeat
the entire thread, so I quoted the lore link for more details.

1. We have platform firmware-provided SMCCC interfaces. Based on the
support/availability of these function IDs, we want to load multiple
drivers.
2. This patch series adds a platform device to represent the
firmware-provided SMCCC resource.
3. Different SMCCC ranges are now represented as auxiliary devices.
4. Different subsystems, such as TSM, can autoload their backend drivers
based on the availability of these SMCCC ranges, which are now
represented as auxiliary devices.

You had agreed to all of this in the previous discussion here:
https://lore.kernel.org/all/2025101516-handbook-hyphen-62ec@gregkh

-aneesh
