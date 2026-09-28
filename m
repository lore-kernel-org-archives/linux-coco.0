Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610B835DA4C
	for <linux-coco@lists.linux.dev>; Mon, 28 Sep 2026 01:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790558942; cv=none; b=DdZyamW7+IFG8QZ/glNLxtxTeVJh4GKu8phjWzQ5cWD+7QazP8Crt6i+kC8yPiaVeBYJTiu5YcmmXA5M2buDZtNkTT6Pg2XuycjyCK9K06CKNodhO2VPFCsnF9gDvUXGsnWF1qlbJZFvZIZIWyXPs9L4oKawpyz1wEF0Iv4tyqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790558942; c=relaxed/simple;
	bh=K1Rn6LESGV/7OPV/x6+LGZKGuG6ZqQ4flZrk7mZ+2JA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y4VnybhgWvX4hS3Lm3SIhOcpAsnaB94SmH+zQIFo8+0R0kxbemWuNw3l+xV6LR4XN7ANbSIWeLkQpE7TS43XWlNS3BQ1eWCH7GkPAMy6YkwkNs3wyWTbcz1uzm1+Mw9nEd+rXvacTY9mtJhFw0Xc18pmyi12f67+EkFPCMk4t74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AfaSuEIV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AfaSuEIV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790558939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q/Ho7D9pnwA8vFx1jX3g6jxL7io7VVBJIDHq0PV6nYs=;
	b=AfaSuEIVJYhxPBIxTIrDwUHaMLcI6NEa17vPc5mvpFDD5qWE3pNeG17tzoj0qcjB/uWJgY
	+tGeCN0hbHECiYG488GOen35HYexvfXu8WAE3+RnKyrJa1N6zokqJcgj5G6onaNJeAVOzL
	igjjE4nqiyy9qQf2gI0/EeVK/S5Dvtc=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-90-aTGlr5Z9OwqqJd6Wh6BObw-1; Sun, 27 Sep 2026 21:28:58 -0400
X-MC-Unique: aTGlr5Z9OwqqJd6Wh6BObw-1
X-Mimecast-MFC-AGG-ID: aTGlr5Z9OwqqJd6Wh6BObw_1790558937
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d7443e0f0bso34867165ad.1
        for <linux-coco@lists.linux.dev>; Sun, 27 Sep 2026 18:28:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790558937; x=1791163737;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q/Ho7D9pnwA8vFx1jX3g6jxL7io7VVBJIDHq0PV6nYs=;
        b=S5CF6Zlw2fnKA999AqBAbkR3xL/GjT1olUdKm9ZnK+3PitKMlkKPe4LbNpXCh1tXA9
         1fRlbViJU5+f8vYaJofe/BNhKQn2K1F39AvHEaWAVIotRdP8UPfmeV+31ptejNmLfAUa
         yppqKVOGnNzkxz8VqAlNm25WYAc7OhCV59mL1oHLt0uQsfUcBshmOedPrxhwG5WaF/sM
         fsvy/6UE3E6pDg+8DFBfEkSp49I9eUmqUDzERo9PpvlGwuWRJvCxdSXQH/9FhmsBH0t/
         69ssWAv5LgrCK4l348ivoEOD8JlO+F51GExLMkOrFv9tZxX7WvEUfLzJ27BtXq1BSIzF
         PVXA==
X-Forwarded-Encrypted: i=1; AKwUvBwwzr/zwsOE1JsOudhEKI+yBMslYOeH3vP+9joEbPBT0S7ZSOL8lukTqTfmUdqIRta3tEoupS6qnwqY@lists.linux.dev
X-Gm-Message-State: AFq9FYKwLHBQ38ckmWKPqEm1Wv1Z5OWi+CBBJKFLNb4JGqaCp+m/ytB8
	DNURa9PC9/lZe6BWavSfgZqvj2rUomPtBdOKC/lAC+c/X0QGYDAT/fcPpmxvRLamFyYJH6VpQ+m
	fiRaYiGUgSxDpM45UW0/+tKCQ//XHGCBqzpCtCi/oaLtJ2M9IyJUIWXmwHctxjMo=
X-Gm-Gg: AYBFou0LXZkXxjLkoYsKJz1LwtQrQODylFE1E2MjlxzAfCnU0o30M/8PweuObsX7Jlr
	R9p2kfMUigGh8kwC5s08pZlxorWzC1YKLPrlv6o5NTuZHtUYgqtn5XV0kU6gqED6xpXsq6EPDiN
	XgrqoYOirWWkUT0XogfrxBRXwymOg3WrdQ8IdjRLDrpw97MLekJWftPSC/VJavEL2D8AV5O4xmq
	DQHufchckAarHuD+LWCsZ6JSNJxsg5NuxnegiqKs1krp2Btz0vC7lJV2H9QXXEVNFx3C2jzFpm0
	hTCHWdRkasjtPQNgCKxJ6EYjjUlJ+xBXRNxEWz66Jgl78Hu1Eip2HvmaQ4RQWnyVv2ib5Krklsw
	PhFVnJNGzYnTf9UKLM9QIpjg0U6M41Ezmswim17094w==
X-Received: by 2002:a17:902:cf0d:b0:2e2:91f:40e5 with SMTP id d9443c01a7336-2e2091f44f2mr12401615ad.59.1790558936703;
        Sun, 27 Sep 2026 18:28:56 -0700 (PDT)
X-Received: by 2002:a17:902:cf0d:b0:2e2:91f:40e5 with SMTP id d9443c01a7336-2e2091f44f2mr12401385ad.59.1790558936289;
        Sun, 27 Sep 2026 18:28:56 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142b00dsm33448475ad.49.2026.09.27.18.28.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 18:28:55 -0700 (PDT)
Message-ID: <699c086a-afb1-4738-bddf-54e98b8a3c34@redhat.com>
Date: Mon, 28 Sep 2026 11:28:48 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 17/20] KVM: arm64: CCA: WARN on injected undef
 exceptions
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260920212845.707-1-suzuki.poulose@arm.com>
 <20260920212845.707-18-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260920212845.707-18-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1Asl-GXhqBhYwMyUDiZC72flJXdWNVEl7tOu2pLU87s_1790558937
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/21/26 7:28 AM, Suzuki K Poulose wrote:
> From: Steven Price <steven.price@arm.com>
> 
> The RMM doesn't allow injection of a undefined exception into a realm
> guest. Add a WARN to catch if this ever happens.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v15:
>   * Switch to KVM_BUG() to mark the VM as bugged as well.
> Changes since v6:
>   * if (x) WARN(1, ...) makes no sense, just WARN(x, ...)!
> ---
>   arch/arm64/kvm/inject_fault.c | 1 +
>   1 file changed, 1 insertion(+)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>

