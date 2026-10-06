Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F7031E82B
	for <linux-coco@lists.linux.dev>; Tue,  6 Oct 2026 03:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791256237; cv=none; b=TZe/lMSDtG8xgAOVyLXfdP8xz819cLztQf8kMN7yRdlDEqea4URu2J2I/2k9D+1S6hzABKVPix88WjbWJU7Q6EE2dn2wMFFefL0Jtjka619aTP8H3VoWccg2Mq2+uwCF5iOidmBh5/ANgEX8ejxVhRnBarR8B45ACga2HPUevRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791256237; c=relaxed/simple;
	bh=76WpONBN9qNsewPTXdIKmJj1yYZGsKR8SJ9xH6J+4Rc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j8zzwCiUvud1JyEXr/BtCjQnlOYPRar3k4IQtHOAP9yTbcF2ZCeW4yQbGMIhwuwalnln6/iWtv55bFQ21ZMKiqix0MzEv+eNS5itwEnf9m05qP5c5S6i2OLp9iJXzXfVJESO9IiVrhc8D+9CbGsYVOieS3iKo/orYOeFZa78XTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MUixmHbJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MUixmHbJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791256235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NLjBEqzF3bLvG463L+dBKbw7TfCoymi8l+jbKvUBXR4=;
	b=MUixmHbJkEDXWFHhlYwcq7PDTdRuyWMlJamV3E6ACNXXXcJIDgXNzEbQed5JvBRHcNVnJ0
	4VssfWEA98/OCYSmobH2SUUIFBSkV3CmBkN3kB+OdOIr5c8jkL+Ak90ZuTOypqpNJNXxus
	jDfwbqfRKUZE0cRTjdqaG0TgjoJoCDI=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-168-pUpI6ZqcOkyh0g77N_yYhA-1; Mon, 05 Oct 2026 23:10:32 -0400
X-MC-Unique: pUpI6ZqcOkyh0g77N_yYhA-1
X-Mimecast-MFC-AGG-ID: pUpI6ZqcOkyh0g77N_yYhA_1791256225
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a6d30f66c9so644597a91.0
        for <linux-coco@lists.linux.dev>; Mon, 05 Oct 2026 20:10:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791256225; x=1791861025;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NLjBEqzF3bLvG463L+dBKbw7TfCoymi8l+jbKvUBXR4=;
        b=imUilV/GEufrfrr+XmE61ip51gJiRuWM9/3B7vzBWpMW2DYlJfoKyy+Fed95sPH20l
         7Mkqk+avEHwk3qq56J2lX+bUvM8Wka5FnrpTYReFsD1fSJ707ODATvstP5xR7lshPI9F
         BaghTrkZ9mdVNSm6n96E6cKIjnMmQwKPK2kWWazZ54SMyJ5NvtJMgBrqxJUztMqJxBXs
         ewhrYZJ4d/6IBZeSkJK2W7J1uPeemXM2yKUUdPf1stDKaixZTrcapTA7vv7GBD8vlEmp
         y83AitpFGEZzU6QrG+Kii3OGKk6/VDg3+gjf8OnNMLkRCkr+9htoeFRUosjsZnKlkr0i
         aWZg==
X-Forwarded-Encrypted: i=1; AKwUvBwTPEwYJQseOx+XXTPTbSofFACWnBSmfNNJRSIkgtBni9zde7epKzzEsoPFprLaCGTqeYKA2ijMJKW9@lists.linux.dev
X-Gm-Message-State: AFq9FYI09lvsVQ+Ip0A8tDtbVgnAD2bEO1297Q3lm64s9F8IMKib3Gyi
	bWmjJQTma1uTT70H8paf5OVYlPipCAoGzvMtYka4IapwQYObOpXYa2VGb3syuCglPa+16ulAqZJ
	wemqD0BmFEP783WVRxTg7JrUOxysoh06N8vFT2eFNCDPOk7OtpGNpJbnZDSE5QIE=
X-Gm-Gg: AYBFou19xAe3QT3HFnwQTc+hWo8jP701y/FviE5AadfJq0Pz85dyOeL9IszHEmM7wp9
	M9sNvfgUZPHX+7pBPZ0qGdLIz2+J4z7hZkduRcSnAYh4tH9TKtS4/sfVA1ZzOIIwiLA5IVqn83p
	8AOZ2da3VHkj3MKLK4R17m2HACiLY6HE6dJGNJHmGySxAvxgjLrH4a8lL63UIUpKKXgrpEArFjm
	jg3fjAS+YHxhmoO0MAZmmqtdeRX7ovYg8mNOP74y7gXeykeGVCIsRYCkBNb4pvPVPxeUPAydQ6+
	OWosKodry8DnO8Gq6Bn7EkgKgsHC5IW9LA7P3zaYwFlhvDpYuaHPcMsrxKICWhwaUZSgeSsVg6E
	w2zGnnwdGW/fjqLH8suGASlKlimzFivCGF+AGZX9Dyg==
X-Received: by 2002:a17:90a:d64b:b0:3a6:d2ac:74ce with SMTP id 98e67ed59e1d1-3a87368d0admr19226a91.19.1791256224558;
        Mon, 05 Oct 2026 20:10:24 -0700 (PDT)
X-Received: by 2002:a17:90a:d64b:b0:3a6:d2ac:74ce with SMTP id 98e67ed59e1d1-3a87368d0admr19217a91.19.1791256224127;
        Mon, 05 Oct 2026 20:10:24 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8543b0c1fsm3110944a91.14.2026.10.05.20.10.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 20:10:23 -0700 (PDT)
Message-ID: <9f9575f0-be48-4dd0-ba1f-98d8dd39f10c@redhat.com>
Date: Tue, 6 Oct 2026 13:10:13 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 14/23] KVM: arm64: Mandate VGIC v3 for pKVM VMs and
 Realms
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com,
 Fuad Tabba <fuad.tabba@linux.dev>
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
 <20261005090754.2140522-15-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261005090754.2140522-15-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7Fzwyn6t0KWG-BqBRs7-GZmUV4yO_pJudfNBHhpdSbM_1791256225
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
> pKVM does not trust the host. Realm VMs follow a similar trust model, with
> the Realm Management Monitor owning the protected state instead of the
> host. Add a helper to identify VMs that run under a host-distrusting
> hypervisor.
> 
> Use this for blocking ioremap of vgic-v2 into stage2 and prevent creation
> of VGIC other than v3.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   arch/arm64/include/asm/kvm_host.h | 4 ++++
>   arch/arm64/kvm/mmu.c              | 2 +-
>   arch/arm64/kvm/vgic/vgic-init.c   | 2 ++
>   3 files changed, 7 insertions(+), 1 deletion(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>

