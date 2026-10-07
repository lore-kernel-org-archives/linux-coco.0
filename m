Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9608B49E5F9
	for <linux-coco@lists.linux.dev>; Wed,  7 Oct 2026 11:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791371996; cv=pass; b=cQjkUjcZECZuXVvfLja8EKcMgKnfnjyIIytUPpCwdilYYiKRza+TH4+kQYelSTjxb1GhnDmrtClyRfkighRd9MphGxTr0hugF4vjkdO9chn2Esb1PuS9VAY5TNKwXug4bligv+7siCWsVN6hTGJ+4vpT+pmtFdrggvvJurO9m7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791371996; c=relaxed/simple;
	bh=VTU69CrXg+oUNUa21qt+heVePxURpvvJ4P7YR2kHJSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=edU5lGJE427DDgGsXxhiK6StkRI2X42+3wdQOYjwOjuQYiNgIx9Ckkw2BoKm0QmN6TkMMxwplkZbewOHEGMXXJ47YQDZm5hzfCpD5nUctwsk7bq07Uhnvx+hZSBtNened1cuIgBSK0GabbL6W6VbhinphW/GF3Gbhfdw/oBWMv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fnuNFLE6; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fnuNFLE6"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so8023e87.0
        for <linux-coco@lists.linux.dev>; Wed, 07 Oct 2026 04:19:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791371958; cv=none;
        d=google.com; s=arc-20260327;
        b=pgBFHeNEB0ngUzkDuVD4pvmR1ormbJyVWQIBMeoDB955+rZv6bk9MitklbcXtF2oZj
         CyIzRWZeUl4Frv0byi/sj164EAUJ+xwEpggJDmwzntZTNiNpplhR9xwSXP4C9ZEWltaL
         T3F8hCgWXFRVrbF3+8zjt+JuoXV6R2WtW0HQ+rStbK4Jm+ZB9pO1ykjAXXrO+iQqsa0P
         9m27lwOFK1aacx1Pzm6Be0VcNC0mPru7P1riVCA3t/q4NcAulFv4up902iEFcdplySLE
         Ck/lTVo0+Wvd6un1OskMyglWLx8IDP4jVX/m3XQn1ESWioaAtbeZdMwKHsLFAYn7vsVh
         I7jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VTU69CrXg+oUNUa21qt+heVePxURpvvJ4P7YR2kHJSA=;
        fh=eKty60KnE28hA67NHum/kwsXwyzVQhwHxocv7UDLt5w=;
        b=YqIfuBZO8u4tNGqUJLhclEgCtXx4aCYnGvXQyReJPvMGKY4IKQ6vb3g0Uw7iKtndWF
         8gEPAxqrydcm9bjEyq36ZC1+OErJwDSO199t7G2orsU4JC7pIq3C7CYSOcP8FU5u7aaH
         QjgZ1tGMQtPKRaOos5fsU3zb903k6yHUpB0pGifddUD2J9aLgiQENtMOibsGSb670PnF
         Mkjq2ONmSx8RxfodYRweHaP8eL5+oFMsiPAftGZqQ0P2SDOEMv6eYOP30u+3wpfkOJOO
         tn00LMKJEfsXylUpIg6s98rNVnrdpwalTdkl/hstt3kmy7uPC3IIyrMyNPT9T8drXkN/
         jlpQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791371958; x=1791976758; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VTU69CrXg+oUNUa21qt+heVePxURpvvJ4P7YR2kHJSA=;
        b=fnuNFLE6EVVEsb2AIl6FIWy6+RnCbiZIX1wgHldkhwUnzUEdnlnS/kJvsqVBrBEMwP
         jw0+4RhnuSCtqNX663320KGww0g/ZsFBslajCcXVllcn7PUOFDfbH7nGGWgil7Sdgago
         fSn8mUVovhb8fDVYL8S13XFbN6JWDdS9ofqvFLwQOVdESN4KpB4Qko1yPqwEkOOecEZe
         PcUDZJdEKmIheQmrml2UlcEcBByPqJse4jgkO4vVlTMMkZeEshqpHM53jWES+lGNFSKv
         d3QypzrRzCjxJcQnTVPFt17pLeXcx+9dAXtjkSofyEf1VL0WpSWrcC2mhZMlcIpihehD
         Ngdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371958; x=1791976758;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VTU69CrXg+oUNUa21qt+heVePxURpvvJ4P7YR2kHJSA=;
        b=HIqk9YK/Q2DE0iP5IP9AlxJ7lZWHyIUS8ifT04uRDf1uuYJ6gKYlYEQiZN6uWXhF4V
         AgNMMglpOTqG5bXCudz/gwWm6tCH81USFZsOiqsBMcPrq6sEMVn+vYhWVEzv67ehVFWZ
         K2z3/urTbBDJhlPO0yUMe4SIrGvWRkqcWUV66ISoKNdL1YZdoLEJbxzJF+1oyI2j+2Hi
         FiRr+lLcif8lgjOimjcUpEFwsJJKDU+c76dmFSWX/Bv5Xk6QJkyY8cpT3z3ABkT+Ojx1
         8WCp1pZl3z5G8HhYBlQ9pIpvokPzh9M36ABlRIaKOBzKAYdfETE7YX1qrWx9MwqVTQ0N
         a9zA==
X-Forwarded-Encrypted: i=1; AKwUvBzT3X3QZ+LSd5TWNhjCinZbismcywm/qo/xxGZvurnJAIQ4Y4SPdZeB8I79ygyjm0E0zoJ5RDj/l25T@lists.linux.dev
X-Gm-Message-State: AFq9FYLXbohf1DDZSuX8CQizIluSMaxc+unGN0UV/ED/dD3s2JApCtpA
	5atZ5t+W7VV7yT6VPSKVzR/jotI8EVcVyUq3qUtWxQ8joHNWOi5vGvyvwJ2DCa71fT53aAdtIIX
	cl5VXH8672U1YoVljqIQixS0W4QZfxcIgS6ubQOgM
X-Gm-Gg: AYBFou1ewvcBEYnJFZ7yXmiKksZm7TQP0U7Xtcwz4wQSoOHNUb4sov7S7w8yokeeH0z
	OKtWpnDynrCB7qYJBpo7ddG6iHyLf6IhLwHJ7Eo9Rqx0kr1iqjq5nNG9PmvEmM9HZhDdI8j6pHH
	i9HyvaCd05bRlWo6twyk5Me6L9f51nF7Iaj54ILFNlq8WLZyonPP7bXpvh5YtOjRgG0MIpFcNDZ
	T39FLUc72X3WkLOtp1jTQEJYtqAJ2lW3Fe+vy4WhVyWidg4WChhXjST+77RXwKzbFIWQbI8jhY8
	pMWeIc0jVG6+jKh9yvHFwuAzArzm1NY7MLbWj6GooNxRpGid4PYtLA==
X-Received: by 2002:a05:6512:1385:b0:5b8:e262:d32e with SMTP id
 2adb3069b0e04-5bcca7ec141mr318055e87.1.1791371957703; Wed, 07 Oct 2026
 04:19:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261007073537.2454351-1-suzuki.poulose@arm.com> <20261007073537.2454351-9-suzuki.poulose@arm.com>
In-Reply-To: <20261007073537.2454351-9-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 7 Oct 2026 13:18:40 +0200
X-Gm-Features: AclHuK9FLvM3LbOukRQncRzEinU8YnpJHc3NQvReH44DvOmDcByJyESZjTaqDmQ
Message-ID: <CA+EHjTzV29F+MoKAKum1rUS8ZBd2j2w28yQWfHL4ymfJnVzG=A@mail.gmail.com>
Subject: Re: [PATCH v23 08/14] KVM: arm64: Add vcpu load/put call backs for flavors
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com, 
	jonathan.cameron@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 Oct 2026 at 09:36, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> Add VM flavor specific handlers for VCPU load/put, in an effort to make it
> easier to follow the code. pauth traps were removed from VMs running PKVM
> as it is a no-op for them.
>
> Based on a patch by Marc Zyngier
>
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
