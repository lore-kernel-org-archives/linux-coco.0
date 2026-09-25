Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32493890E4
	for <linux-coco@lists.linux.dev>; Fri, 25 Sep 2026 13:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343252; cv=none; b=ZX6d2pjbu1jlCA/JidOScpNnmiAX1dbsVaHjLOHhxTp34ztD8uAVJtC8hdF3o0bPOJVRxgpq/wQF5yUzIVh5CQneUUTOyHclLmU/Vt5i0CF2RrkBIR2Ud18hTpADM4efmuYXclVdfN5xMZTFHMGncSkOyPJ6ROzrknK94MDAT2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343252; c=relaxed/simple;
	bh=Xkbzp+59lZb6QS5UiE9K5gmadx2N1RgDmtC8Kx8n1f4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W+6D20FWDikXMYJsOU+Vt+97nbbc8Jf6Z7swwk2mO1p1x1AcjkxjTCBqQRePQFgAhTl4lb1yNgbAvpFskCOf1SN9nVQnMsPr57FaJMhbxBSgd1M1SV4Cwf4pPlcOTnREoO/sABp9mEUtknbLsR3W0iSeDBJOXPnMCVtu5JdjAow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J9c5Qxcg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J9c5Qxcg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB78A1F0089A;
	Fri, 25 Sep 2026 13:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790343250;
	bh=J7BTVv9M2t6UycuRtQW9aKZFQTkmt/RfJKSQfMD+kSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J9c5QxcgBQsysK4mhSWACXG3h7qDWwkF+PgyDo2RQWay0ti0hPEjDJUQfFCoixqMG
	 v4lQ/rsWA7h8ZEZ4nZgcDR6kVo/PKUY5XDM0GsRGpIU8PlF6soMyRhvkRzQdO0e1/1
	 p3rezIA6kYjAMYF+gDJAekTWThPs/dltZO0ix9Pgv00qO4Y+VmyL24WhXLFfyJsz7G
	 yQkzFSC+CyAIoNLacMDoAeAs7J/IMl6X6OEbjfXz4oTHYQReY3e9h9O4in1oJyENzJ
	 nzT8T7vaiOKSvw4Jq5OO576kFhYHjlMnHl1eCGDP4WahbgCfprZAGgx0TpVbDeFDfw
	 VMEV//kIL+nQw==
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfauth.ams.internal (Postfix) with ESMTP id 6F553198005E;
	Fri, 25 Sep 2026 09:34:07 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Fri, 25 Sep 2026 09:34:08 -0400
X-ME-Sender: <xms:Tni2at5GhomL4Xd07djlBzZoZTMX_WzGwXYu7SJ5APSbZGnvC71VHg>
    <xme:Tni2anQgYEsRF45oy8dP_53gr-DuvrPcWMzJUsJKmlA4M2WGJfpGfjEb4RgTIxAr3
    iXGWFQRep6bDZcbVPTofedPkbHsHfJDo04gp6hsXp4Dol5JPak6gCUm>
X-ME-Received: <xmr:Tni2ao6awTp7_mlaOR1xIBV6D8MYhB5Lv_f-4YToiUdQJe5jDinpnl96RNc>
X-ME-Proxy-Cause: dmFkZTF9/S3DM4Gd0u3MhRtzAbighuockRcwnSZG0fQCVEPJOOrFZ1EkaEE9XzElQDnvbX
    om7OmlAaL25u612xvrifXFLzBJCrGkirI0A18OXo+AT2mUT9wDvhqvh8vREtNgpX2Q/eOP
    sP+/noYxD+h9vGO9uAHO4j5Yuy55I5aURtHWNli/AwFGXqik8xlN+i20HtxxyH+8KgoEUW
    +RYN9d5+6a055X6IpMQEZ8Vfd9m2C2EfuSdotqAiy5tmhSPffRlJ1ZNAUecqFyfaxjfVBY
    wo8wiE71ZWh0PxrqliK5tvvbnbUmqEeS8CvQZ+WXNSmUucDo8xC2ONexcPyK3S99OPRFnf
    5CWyRo0cGz1zOesk8u6DWLfbtVErN7vt1qyqwFD1L3I3RWanpaLED+8S+yYWaH7u9hZy36
    p5tIf0fj/K2EDtG7sIOQ/2lqi88gTQD9L92xuIP46XSDEFx7bF8bTY0aa1ygW28defjs4H
    +3lUHsweCFZnwsxFTZZhvRLfNDRDpXYpjt3QTfu0aEbjeq4dOdp5tlxfk/pkiqwSEQIfyB
    mYcBajaJGDxzdCE0rgZtct4+csk/ZbcnGhAnAc4vnvUCXadmg3KcJWkkDNWcnwDRP9H3iW
    +f5CKuVtJeChWFH7sqMDzuimERhq/j9tg3UZcpJEZhayAlUuQQuEKCc7dmcA
X-ME-Proxy: <xmx:Tni2akR3Zxv1y-GJFXMYOA8ZTTiv-BbNn1Izq0b-TU0h7hRQ6MEA2w>
    <xmx:Tni2atl_qzeXcAB9Bf51j2M4vGSgPEZttfUR5H79XHZiO8oaakRUpA>
    <xmx:Tni2aoSJVe5fJU1N7XhQrnTi5NY6GcRJfZgtdEhDu7KOsZskBciAcg>
    <xmx:Tni2aksq0yXXDGOlKo7S4Pq-NyHRFbGWQ7oP6iigi3japCXXp4547w>
    <xmx:T3i2ah7Xtg2N-TeWm4fwtsqeiRjf0PRQWNLawbeVoLcie7SddkystfJP>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Sep 2026 09:34:06 -0400 (EDT)
Date: Fri, 25 Sep 2026 14:34:05 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: Nikolay Borisov <nik.borisov@suse.com>
Cc: rick.p.edgecombe@intel.com, dave.hansen@linux.intel.com, 
	xiaoyao.li@intel.com, linux-coco@lists.linux.dev, x86@kernel.org, 
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
Subject: Re: [PATCH v3] x86/tdx: Restrict attestation exports to the
 tdx-guest driver
Message-ID: <arZ4MXTfCuPw9dMh@thinkstation>
References: <20260925131808.2415177-1-nik.borisov@suse.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260925131808.2415177-1-nik.borisov@suse.com>

On Fri, Sep 25, 2026 at 04:18:08PM +0300, Nikolay Borisov wrote:
> There are few remaining attestation related functions which are exported
> via EXPORT_SYMBOL_GPL, yet they are solely used by the 'tdx-guest'
> driver. Let's just limit their visibility by using the namespaced
> EXPORT_SYMBOL_FOR_MODULES.
> 
> Suggested-by: Michal Koutný <mkoutny@suse.com>
> Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>

Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
