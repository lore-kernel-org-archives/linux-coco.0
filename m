Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D54F187554
	for <linux-coco@lists.linux.dev>; Mon, 13 Jan 2025 11:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736766761; cv=none; b=AM4Qe7kexnyp4d8j/TbQe09HYgM0LZsjksyLRtwnbJpsCl5SqiMO7f5Q/ljPyZcMypwgnEOJTPUsPAb0+XNHJtoz4XUL2H6juQ6DjsXXkqmMO7W8EsROXCspxtw7H5aTLcIE5MScqPkwdpghfSKDGZpTO6VUW2phVb+NIYSGVxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736766761; c=relaxed/simple;
	bh=Z3WSU+6FFxJLM6CUjCkryC8SPIhcqgY5fUJOu9XSwf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j7HzRb71zLTf7k7ipTjfOjbLN9NlOup0iM/J/Zl0tTE7ZYO+cjO3EpFj3k7Co6Ppikh10zP0S8c+t2H9t3oxps5z1HBjFVrL+7HTynKGKvV2JN89LM/KXsMeWOLswTOtkydlD+H4Wzh7olo6MVXRyuoR3aZR3M81N0u3G3VIvUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iFdTAiiz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iFdTAiiz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736766758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GvZ5YyOZqS4qQ+IVt/QwWmi22IObMOtrbJQs16hBmp4=;
	b=iFdTAiizsbpy8B1m0eeut2+NVWzLKXSOl4yl8ds7QCuOE8pVjMlEnpsTDS1jM/0cwjbDAt
	u+FSLmIGPTzfnPZKD5ReI1vdhcE8EXx21zD2qTe8PsriSHV/B5Bo42Zsvfq0nq4XQ3xjk0
	i57uanYCxh7en08Cjn7WKfxlp6QUvoY=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-407-2hCAAAdcPNi7lMRFz6b6gw-1; Mon,
 13 Jan 2025 06:12:37 -0500
X-MC-Unique: 2hCAAAdcPNi7lMRFz6b6gw-1
X-Mimecast-MFC-AGG-ID: 2hCAAAdcPNi7lMRFz6b6gw
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F018B19560B1;
	Mon, 13 Jan 2025 11:12:34 +0000 (UTC)
Received: from localhost (unknown [10.72.112.156])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C217D195E3D9;
	Mon, 13 Jan 2025 11:12:32 +0000 (UTC)
Date: Mon, 13 Jan 2025 19:12:27 +0800
From: Baoquan He <bhe@redhat.com>
To: "Kirill A. Shutemov" <kirill@shutemov.name>, ebiederm@xmission.com,
	akpm@linux-foundation.org
Cc: kexec@lists.infradead.org, Yan Zhao <yan.y.zhao@intel.com>,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	x86@kernel.org, rick.p.edgecombe@intel.com,
	kirill.shutemov@linux.intel.com
Subject: Re: [PATCH v2 0/1] Accept unaccepted kexec segments' destination
 addresses
Message-ID: <Z4T1G4dwzo7qdwSP@MiWiFi-R3L-srv>
References: <20241213094930.748-1-yan.y.zhao@intel.com>
 <xgycziy2o56hnom3oau7sbqed3meoni3razc6njj7ujatldnmm@s7odbl4splbn>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xgycziy2o56hnom3oau7sbqed3meoni3razc6njj7ujatldnmm@s7odbl4splbn>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

On 01/13/25 at 12:01pm, Kirill A. Shutemov wrote:
> On Fri, Dec 13, 2024 at 05:49:30PM +0800, Yan Zhao wrote:
> > Hi Eric,
> > 
> > This is a repost of the patch "kexec_core: Accept unaccepted kexec
> > destination addresses" [1], rebased to v6.13-rc2.
> 
> Can we get this patch applied?

This looks good to me. In v1, we have analyzed all other possible
solutions, however change in this patch seems the simplest and most
accepatable one. 

If Eric has no objection, maybe Andrew can help pick this into his tree.

Thanks
Baoquan

