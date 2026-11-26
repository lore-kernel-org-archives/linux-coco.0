Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795697226;
	b=FuiJxQTLoGMLo/0sCt0btNvx2HE//F8XB79PYkM9qGDLm9hQ7ZWkh/7qjaDeHllEn8NY
	 Tq8sbK2fyvUcTyi02Z9LJW7BhcroAkphjdmcJkSQ/EzawO4ZLoepVPNk/t3lsSlsCohkx
	 LfLIgOPBiLVtzmgr88lMp/hx4YTDYscuYEkgB4Q29zbN8YtL4sY+Hbc/zkjDEapA2iOmd
	 6AhMpCXit9YfFjcoIe71EgoqSEosX/I/ogNypQv20ss8yCYdVUTO6H7vEMdUkHRYCNR/G
	 vJfXRNBT4YttOrcdZFyfn8KjaMFSUPwL4g6E9ugVMt987xt9ufX0f4b3vLZ//+so2KA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=0sDCO1ovM17uMu/VOcrsRpcY05yXe7IWxHNvX+k7W9A=;
	b=xzWuTKqHVuxgkJ7Ln7oSOEk+I0h1eC++4tqnoROUgC4PvbBfiNM/Tp5Jym968ZyOTsoW
	 mXwp9FiYsuzLGlBhVo3KLDkjNTbUnkDxUoEiVZt+qW1vfOTAvCex3eI4jCZL2rX/GiKkV
	 Dbp81yGLoiFLMehZI4/hRA7KFyaRLTbbZkG89TP4FsREu4ECMYoffu9zZDpStlxqPtvzH
	 tvjWwnf3rQurbNezjnPER45EVKgfFtUWAR54Mj8ZgyYrY01L2vHFvnIYTcsZAI6nkORX6
	 OZa89fOSnxJPY4VFrSxqQt6DmclYm/FMen0Nb7S0dCl/vMkXCVjnDgs8NvjGCKLAyrw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flashbots.net;
	spf=pass smtp.mailfrom=flashbots.net;
	dkim=pass header.d=flashbots.net header.i=@flashbots.net header.a=rsa-sha256 header.s=google header.b="eoFk/adX";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385B4606A323
	for <linux-coco@lists.linux.dev>; Thu, 26 Nov 2026 12:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 385B4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=flashbots.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flashbots.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flashbots.net header.i=@flashbots.net header.a=rsa-sha256 header.s=google header.b=eoFk/adX
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-71ad099391dso3371962eaf.3
        for <linux-coco@lists.linux.dev>; Thu, 26 Nov 2026 04:47:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795697225; cv=none;
        d=google.com; s=arc-20260327;
        b=DUhbswAKGGj8F2akFniTwtnIv4XMoZ2Rwwu9QQGcEO0gFVmZbbAZ8+ac7VuOPZhhtW
         WA4iqGqhcAklhpSfzrwgaQ+ft2Td4D1v55dUHqnEBQhW7Qboz7bwTXs2On54PgEMl2V7
         /+zi2bA84IVgGxAnsE+BV5GJqejfqK5Ew+eeGIdh54JioK664ZFZtdwX9N4TgtPBfCTW
         mfvpsvoSrdA8gIYAalOpaAwqNuEgJiFvsM0sXMpgcd8d5uQp5+8VgpXlZDRVeyV7HIOu
         2TmzAFGFC8++zPg2NjEL0F+Liq3KqCr/tHCvf0OfPzJRVDHAETQFojQv4EOZqcYqcG7I
         wSQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0sDCO1ovM17uMu/VOcrsRpcY05yXe7IWxHNvX+k7W9A=;
        fh=uxMiUbNpbUdsofIebQzlz1P9NmlAxRmFcz9dMjmSGro=;
        b=di7v4p12oIS8P4QoS8eJYyzan4nB4awJ5cZ6TRnWjVhkOdnumP6u4T68FLeeO63fS2
         4FjO3vzzqk/FI8GXgaWizYFLw4dGVCgjZ2o53SZDghl+zOZa9xmy3h7Vb6wRGi40xX24
         3/MuJDF3RGCZkgPpH0lWXQJgWXs/U2bdwgtV9f21x1nYrYE+WxW1xHKmS3q1ISVRDUvK
         wk2juE1UVV+bfM5qcce8f9GCekXAFexz02C9Ocn4eE5tp+AfoMuq+KeS1SVubHdA4ziC
         O67fp+b/RqHDABk+u92DLI1/Isvim3VRrqfhlR83iBXEFpwLfQ6W6yDMZtxwVDKVKMuv
         Gqdw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flashbots.net; s=google; t=1795697225; x=1796302025; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0sDCO1ovM17uMu/VOcrsRpcY05yXe7IWxHNvX+k7W9A=;
        b=eoFk/adX8xL0Tcrz099Z9td3y43daCxY+jpSJQrCSD+j2jL3WLc+vWsuMLwnhHJgC+
         /kUOJnbsUs5O4McLG1aPW/vycovz3IW6/kDAfXzdLnZnkudnb64bjQ3uWkiGr/BIha0g
         LLKcQ0XOXDuyiZU+vtTsoLRaSRaqBZcqqo0JTMGbmx5vhkCjvDp1mqVTOmDK7Afb9Q7/
         c56BLQrYhEc4y+SGGIkBJlBfV5+3r9oCwvEmsQ9qGdH1wa/ot5olZe0sS1iXfwr9ZZI4
         GOAxyjHoz4Cbg/b1IwqXLZVUVQ3cd4QSmpEOfgiFSajmIwy2izIdswzw44d50QpddxRs
         N6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795697225; x=1796302025;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0sDCO1ovM17uMu/VOcrsRpcY05yXe7IWxHNvX+k7W9A=;
        b=bN0fEGRJ9lRfZ+PqM10yl5yQvtwmDiETpWW+TfURDcvnLAmOMweT/zihsS123TRz3y
         F3YHVBdwt2bJcygTVEVSW5kpIVsCbvwttt3OkTrJjMhbkMbOZA7NjHw2XCVjr857LB3e
         EEfPNL3HqTk1m6VNwsHkBaCARdVa8C/uU6N8FgGl5i2cZXqN0o+jsIpLvtw/rdGXjJc4
         JFNGYQ/yv6WQGOTLHz9UoSH9e9UcgFWceioxY6+YlzE+aaE769Y6p8k3qBva9Quu6FvB
         rSUyDU04SLe+8XtOrbS7rhCbsOWlin6q0OqvFl8T4TbHA/hCM6e37fe4UghVezLxhEop
         kHSg==
X-Forwarded-Encrypted: i=1; AL+hErFpA2pUIXQUa7lo6tVKidrKHcmHRJCvaFz3HV8dtwLETv3eMf46wThAA4C+Mv5sNDdPGBe2j5H/opQB@lists.linux.dev
X-Gm-Message-State: APuU4Z8g9P7N6fEFZQ2y4jW16skiCL76iFQIR2OGG6x8JF5FogGSebAW
	ik80+tuWBvfh/B5LO+w46BfeRNeGt2D/O4Kqmuee6eIb8mXl5rkGUVrE6mnKGsiHJFTgPBaqDHc
	CJeqRp91uunyxL+CfdZHG4QRSmmo3geclbDQVrc5B/w==
X-Gm-Gg: AZFdTZe8AnfDF8eP9yp9D9FejpB3O4YgC/+olXQbND0z7q2iStsy59dDQdOn/OqzJqI
	B004RjjNKPZy8V8XeQZjh3L4vDBBamK+A0eQjdvKRDJThqXRuiq86e0tW0vNvO1FcLZYeOesk+f
	UT7aPcDTI6daB9+pLQ0UCciRr/5H80/1HXCVw13XQSTy5mLu/fiRvSLUlHRJWZOPlqM54F7oOMX
	UaqadPfns0vfgEVWkrw4MgEqBFpmMIUE0tb4UamhbvHNthOL+pzPr2wd5a0AdnJnMiVUcyxsxu7
	iTkQi2j6A/y2SRuYIZzUmz/raKQyJV81rfd0dpILFR5iHe0kd06B2oUo5V0a1gFCV4/N0PF5mjT
	lU4OULYsZJfwgpgfqM3rpqLm8F1C4KWBPvzcZwNAPSukgtMp4AeFLxxqNbyy27BEqyACsZl5ISw
	Ne84qq5cVmhjtNXBXQMMWGv8FvvsN5l71hfAxbY8MfLYKD711Vw4xhvoXOHAgNMXvrwO8yYZHA
X-Received: by 2002:a05:6820:55da:20b0:717:da:ba2d with SMTP id
 006d021491bc7-71b3949694fmr12426690eaf.42.1795697225084; Thu, 26 Nov 2026
 04:47:05 -0800 (PST)
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261125-tdx-guest-quote-poll-v4-0-d89f26854b88@flashbots.net>
 <cd7bd4428398413e16ff214fc46f5d65076757d8.camel@intel.com> <436c641a-9d35-4695-b41f-547c46479a5d@intel.com>
In-Reply-To: <436c641a-9d35-4695-b41f-547c46479a5d@intel.com>
From: Moe Mahhouk <moe@flashbots.net>
Date: Thu, 26 Nov 2026 12:46:52 +0000
X-Gm-Features: Aa3M54qbjy628W_XZiCsTaWPDZAxjlqcXQ_RCIdX0UR7G-Q3f0Ja4RKHzIf02Lc
Message-ID: <CAKV3HMNoCbBeyAsH-UHHC2wWm5fE7ps0mo_E3TKJw0Vk47W43g@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5B=F0=9F=9A=A8ext=5D_Re=3A_=5BPATCH_v4_0=2F2=5D_virt=3A_tdx=2Dguest=3A_Fi?=
	=?UTF-8?Q?x_and_speed_up_the_wait_for_a_Quote?=
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "kas@kernel.org" <kas@kernel.org>, 
	"sathyanarayanan.kuppuswamy@linux.intel.com" <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	"thomas.lendacky@amd.com" <thomas.lendacky@amd.com>, "Aktas, Erdem" <erdemaktas@google.com>, 
	"djbw@kernel.org" <djbw@kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "Miao, Jun" <jun.miao@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On 11/26/2026 5:42 AM, Edgecombe, Rick P wrote:
> I think something went wrong in the send. All I got was the coverletter and it
> looks like lore did too.

Thanks Xiaoyao. Rick, both patches went out with the cover letter and
were addressed to you. Lore has them in linux-coco, kvm and lkml:

https://lore.kernel.org/all/20261125-tdx-guest-quote-poll-v4-1-d89f26854b88@flashbots.net/
https://lore.kernel.org/all/20261125-tdx-guest-quote-poll-v4-2-d89f26854b88@flashbots.net/

Maybe a filter on your side caught them. This pulls the whole series:

  b4 am 20261125-tdx-guest-quote-poll-v4-0-d89f26854b88@flashbots.net

Happy to resend if that is easier.
